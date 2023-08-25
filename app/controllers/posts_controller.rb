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

  end

  def create
    user = current_user
    Post.create(author_id: user.id, text: params[:post][:text], params[:post][:title])
    redirect_to "/users/#{params[:user_id]}/posts"
  end
end
