class UsersController < ApplicationController
  def index
    @users = User.all
  end
    def destroy
 #   @post = Post.find(params[:id])
 #   @post.destroy
  #  redirect_to posts_path
  end
end
