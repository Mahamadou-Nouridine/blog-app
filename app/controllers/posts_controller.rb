class PostsController < ApplicationController
  def index
    @posts = Post.all
    render 'index'
  end
  def show; end
end
