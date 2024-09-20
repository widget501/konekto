class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new_ai_topic
    @category = Category.find(params[:category])
    ai_service = AiTopicGeneratorService.new(@category)
    @content = ai_service.generate_topic

    topic = Topic.new(
      title: @content,
      description: "This topic has been generated by AI. What do you think?",
      category: @category,
      user: current_user,
      by_ai: true
    )
    topic.save!

    redirect_to category_path(@category)
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    @category = @topic.category
    @topics = @category.topics
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
