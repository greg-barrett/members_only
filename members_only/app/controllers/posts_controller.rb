class PostsController < ApplicationController
  before_action :signed_in?, only: [:new, :create]
  before_action :current_user, only: [:index]
  def new
    @post=Post.new
  end

  def create
    @post=Post.new(post_params)
    @post.user_id=params[:user_id]
    if @post.save
      flash[:success]="Successfully saved post"
      redirect_to posts_url
    else
      flash.now[:danger]="Try again"
      render 'new'
    end
  end

  def index
    @post=Post.all
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end



end
