class PostsController < ApplicationController
  before_action :set_category, only: [:new, :create]
  before_action :set_topic, only: [:new, :create, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET  all my posts
  def index
    @posts = Post.all
  end

  # GET my specific posts/1
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end

  # GET me creating a new post /posts/new
  def new
    # @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build
  end

  # GET making an edit to a post/posts/1/edit
  def edit
  end

  # POST creation of our /posts
  def create
    # @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.build(post_params)
    @post.user = current_user
    @post.by_ai = false
    # raise
    # @post.topic = @topic

    if @post.save
      redirect_to [@category, @topic, @post], notice: 'Post was successfully created.'
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
    @post = @topic.posts.find(params[:id])
  end

  def set_topic
    @topic = Topic.find(params[:topic_id])
  end

  def set_category
    @category = Category.find(params[:category_id])
  end

  # Only allow a list of parameters through so as to have some control
  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end
end
