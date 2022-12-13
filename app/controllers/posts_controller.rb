class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @Post.where(user_id: params[:user_id])
  end

  def show
    @posts = Post.find(params[:id])
  end
end
