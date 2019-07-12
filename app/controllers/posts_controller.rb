class PostsController < ApplicationController
  before_action :set_postId, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.all.page(params[:page]).per(5).order("updated_at DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new()
  end

  def create
    if Post.create(post_params)
      redirect_to blogs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to blogs_path
  end

  def destroy
    @post.destroy
    redirect_to blogs_path
  end

private
  def post_params
    params.require(:post).permit(:title,:content).merge(user_id: current_user.id,blog_id: current_user.blog.id)
  end

  def set_postId
    @post = Post.find(params[:id])
  end

end
