class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Post has not been created"
      redirect_to new_post_path
    end
  end

  def show
    @post = Post.find(params[:id])
    redirect_to post_path(@post)
  end
  
  private 
   
  def post_params
    params.require(:post).permit(:title, :content, :author)
  end
  
   
end 