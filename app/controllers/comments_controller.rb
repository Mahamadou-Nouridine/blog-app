class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    puts params
    render 'new'
  end

  def create
    Comment.create(text: params[:comment][:text], author_id: params[:user_id], post_id: params[:post_id])
    redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end
end
