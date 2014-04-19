class PostsController < ApplicationController
  
  def index
    @posts = Post.all
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
      flash[:alert] = "Post has not been created."
      redirect_to new_post_path
    end
  end
 
  def show
    @post = Post.find(params[:id])
  end
  
  def index
    @posts = Post.all
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      flash[:alert] = "Post not updated."
      redirect_to edit_post_path
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    
    flash[:success] = "Post has been deleted."
    
    redirect_to @post
  end
   
  private 
   
  def post_params
    params.require(:post).permit(:title, :content, :author)
  end
   
   
end 