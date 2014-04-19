class CommentsController < ApplicationController

  def set_post
    @comment = @post.commments.find(params[:id])
  end
  
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to [@post, @comment]
    else
      render "new"
    end
  end
  
private
  def comment_params
    params.require(:comment).permit(:author, :content)
  end
  
  
  
end