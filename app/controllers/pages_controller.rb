class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @categories = Category.all
    @topics = Topic.all
    @posts = Post.all
  end
end
