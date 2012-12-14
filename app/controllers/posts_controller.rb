class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    if @post.save 
      redirect_to root_path
    else
      render 'new'
    end
    
  end

  def show
    @post = Post.find(params[:id])
  end

  def index 
    @posts = Post.all(:limit => 5, :order => "id desc")
  end

  def update
  @post = Post.update(params[:id],params[:post])
  if @post
  redirect_to post_path(@post)
  else
  render edit_post_path(params[:id])
  end
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    Post.delete(params[:id])
    redirect_to blog_path 
  end

end
