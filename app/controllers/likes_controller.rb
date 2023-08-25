class LikesController < ApplicationController
  def create
    user = current_user
    Like.create(author: user, post: Post.find(params[:post_id]))
    redirect_to "/users/#{params[:user_id]}/posts/#{params[:post_id]}"
  end
end
