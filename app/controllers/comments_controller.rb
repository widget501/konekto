class CommentsController < ApplicationController
  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment.post = @post
    @comment.user = current_user
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to @comment, notice: 'Comment created.'
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
