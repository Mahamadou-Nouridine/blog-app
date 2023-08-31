class PostsController < ApplicationController
  def index
    @posts = Post.where(author_id: params[:user_id])
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    if @posts.empty?
      redirect_to "/users/#{params[:user_id]}/posts/new"
    else
      render 'index'
    end
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
    puts user
    post = Post.new(title: params[:title], text: params[:text], author_id: user.id, comments_count: 0, likes_count: 0)
    if post.save
      redirect_to "/users/#{user.id}/posts", notice: 'new post created successfully'
    else
      render 'new'
    end
  end
end
