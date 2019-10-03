class PostsController < ApplicationController
  #before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  def index
    @posts = Post.all
  end
  def new
    @posts = Post.new
  end
  def create
    post = Post.create(post_params)
    post.user_id= current_user.id
    post.save
    redirect_to post
  end
  def destroy
    Post.find(params[:id]).destroy
    redirect_to posts_path
  end
  def show
    @post= Post.find(params[:id])
  end
  private
  def post_params
    params.require(:post).permit(:caption,:picture)
  end
end
