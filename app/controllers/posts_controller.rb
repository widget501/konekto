class PostsController < ApplicationController
  before_action :set_topic, only: [:new, :create]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]

  def like
    if @post.likers.include?(current_user)
      flash[:notice] = 'You have already liked this post'
    else
      @post.likes.create(user: current_user)
      flash[:notice] = 'Post has been liked'
    end
    redirect_to @post, allow_other_host: true
  end

  def unlike
    like = @post.likes.find_by(user: current_user)

    if like
      if like.destroy
        flash[:notice] = 'You have unliked this post.'
      else
        flash[:alert] = 'There was an error unliking this post. Please try again.'
      end
    else
      flash[:notice] = 'You have not liked this post.'
    end

    redirect_to @post, allow_other_host: true
  
  end

  # GET  all my posts
  def index
    @posts = Post.all
  end

  # GET my specific posts/1
  def show
    @comments = @post.comments
    @topic = @post.topic
    @topics = @topic.category.topics
    @category = @topic.category
  end

  # GET me creating a new post /posts/new
  def new
    @post = Post.new
  end

  # GET making an edit to a post/posts/1/edit
  def edit
  end

  # POST creation of our /posts
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.topic = @topic

    if @post.save
      redirect_to topic_path(@topic), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  # PATCH path for the update to our post/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE getting that post out lol /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: 'Post was successfully destroyed.'
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  # Only allow a list of parameters through so as to have some control
  def post_params
    params.require(:post).permit(:content)
  end
end
