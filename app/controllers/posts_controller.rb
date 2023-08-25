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
    # data = params.require(:post).permit(:text, :title)
    # fs =qdz.it
    Post.create(title: params[:title], text: params[:text], author_id: user.id)

    # post.author_id = user.id
    # post.comments_count = 0
    # post.likes_count = 0
    # post.save
    redirect_to "/users/#{user.id}/posts", notice: 'new post created successfully'
    # if post.save
    # else
    #   render 'new'
    # end
  end
end
