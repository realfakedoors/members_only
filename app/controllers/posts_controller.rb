class PostsController < ApplicationController
  
  before_action :user_signed_in, only: [:new, :create]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_url
    end
  end
  
  def index
    @posts = Post.all
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  private
  
  def user_signed_in
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
  def post_params
    params.require(:post).permit(:user_id, :title, :body)
  end
    
end