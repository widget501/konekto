class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @category = @topic.category
    @post = @topic.posts.build
  end

  def new
    @category = Category.find(params[:category_id])
    @topic = Topic.new
  end

  def create
    @category = Category.find(params[:category_id])
    @topic = Topic.new(topic_params)
    @topic.category = @category
    @topic.user = current_user

    if @topic.save
      redirect_to topic_path(@topic), notice: 'Topic created.'
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'Topic updated.'
    else
      render :edit
    end
  end

  # def destroy
  #   @topic = Topic.find(params[:id])
  #   @topic.destroy
  #   redirect_to topics_url, notice: 'Topic deleted.'
  # end

  private

  def topic_params
    params.require(:topic).permit(:title, :description, :category_id, :user_id)
  end
end
