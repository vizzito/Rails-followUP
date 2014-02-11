class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(post_params)
    redirect_to post_path(@post)
  end
  
  private
  def post_params
    params.require(:comment).permit(:commenter, :body)
  end
end
