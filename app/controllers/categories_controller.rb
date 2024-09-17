class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @posts = Post.all

    @scroll_posts = Post.limit(10)
    respond_to do |format|
      format.html
      format.json { render json: { html: render_to_string(partial: 'categories/post', collection: @scroll_posts, formats: [:html]) } }
    end
  end

  def show
    @category = Category.find(params[:id])

    @topics = @category.topics
  end

  def new
    @category = Category.new(user: current_user)
  end

  def create
    @category = Category.new(category_params)

    @category.user = current_user unless @category.user

    if @category.save

      redirect_to @category, notice: 'Category created'
    else
      render :new
    end
  end

  private

  def category_params
    # params.require(:category).permit(:title, :description)
    params.require(:category).permit(:title, :description, :user_id)
  end
end
