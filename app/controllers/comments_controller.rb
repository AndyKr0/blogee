class CommentsController < ApplicationController

  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
   
  def index
    @comment = Comment.all
  end
    
  def new
    @comment = @post.comments.new
    #@post = Post.find(params[:post_id])
  end

  def create
    @comment = @post.comments.build(comment_params)
    
    if @comment.save
      flash[:notice] = "Comment has been saved."
      redirect_to @post
    else
      flash[:alert] = "Comment has not been saved."
      render "new"
    end
  end
  
private
   def set_post
    @post = Post.find(params[:post_id])
  end
 
  def set_comment
    @comment = @post.comments.find(params[:id])
  end
  
  def comment_params
    params.require(:comment).permit(:author, :content)
  end
  
  
  
end