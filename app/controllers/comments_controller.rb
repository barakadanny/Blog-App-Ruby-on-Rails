class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    post = Post.includes(:author, :comments, :likes).find(params[:post_id])
    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = post
    if comment.save
      flash[:success] = 'Comment created successfully'
    else
      flash[:error] = 'Comment not created'
    end
    redirect_to user_post_path(current_user, post)
  end

  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    if @comment.destroy
      @comment.decrement_comments_counter
      redirect_to user_post_path(current_user, @post)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
