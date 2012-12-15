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
    @new_comment = @post.comments.build
    @comments = @post.comments.all
    @tagposts = Tagging.where("post_id = ?",params[:id]).pluck(:tag_id)
    @tags =  Tag.find(@tagposts)
    @tagsall = Tag.all
    @postsall = Post.all
  end

  def index 
    @posts = Post.all(:limit => 5, :order => "id desc")
    @tagspost = Hash.new { |hash, key| hash[key] = [] }
    @posts.each do |p|
      @tagposts = Tagging.where("post_id = ?",p.id).pluck(:tag_id)
      @tagspost[p.id] = Tag.find(@tagposts)
    end
    @tagsall = Tag.all
    @postsall = Post.all
  end

  def update
    @post = Post.update(params[:id],params[:post])
    if @post
      redirect_to post_path(@post)
    else
      render edit_post_path(params[:id])
    end
  end

  def tag
    @tagposts = Tagging.where("tag_id = ?",params[:id]).pluck(:post_id)
    @posts = Post.find(@tagposts)
    @tagpost = Tagging.where("post_id = ?",params[:id]).pluck(:tag_id)
    @tags =  Tag.find(@tagpost)
    @tagsall = Tag.all
    @postsall = Post.all
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post =  Post.find(params[:id])
    @affected_tags = @post.taggings.pluck(:tag_id)
    Tagging.delete(@post.taggings.pluck(:id)) 
    @affected_tags.each do |t|
      @count = Tagging.where("tag_id = ?",t).count
      if @count == 0
        Tag.delete(t)
      end
    end
    @post.delete
    redirect_to posts_path
  end

end
