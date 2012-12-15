class CommentsController < ApplicationController
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment])
    if @comment.save
      redirect_to(@post, :notice => 'Comment was successfully created.') 
    else
      redirect_to blog_path
    end
  end

  def edit
    @comment  = Comment.find(params[:id])
    @post = @comment.post
  end

  def update
    @comment = Comment.find(params[:id])
    @post = @comment.post
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html {redirect_to @post,:notice => "Comment was updated successfully"}
        format.xml {head:ok}
      else
        format.html {  render 'edit'}
        format.xml { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end   
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post
    @comment.delete
    respond_to do |format|
      format.html {redirect_to @post,:notice => "Comment was deleted successfully" }
      format.xml {head:ok}
    end
  end
end
