class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    render 'index'
  end

  def show
    @post = Post.find(params[:id])
    render 'show'
  end

  def new
    @user = current_user
    puts params
    render 'new'
  end
end
