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
    @user = User.find(params[:user_id])
    render 'new'
  end

  def create
    user = current_user
    Post.create(title: params[:title], text: params[:text], author_id: user.id)
    redirect_to "/users/#{user.id}/posts", notice: 'new post created successfully'
  end
end
