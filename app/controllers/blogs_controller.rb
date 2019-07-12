class BlogsController < ApplicationController

  def index
    @blog = Blog.find(current_user.blog.id)
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new()
  end

  def create
    if Blog.create(blog_params)
      redirect_to blogs_path
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(current_user.blog.id)
  end

  def update
    if Blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit
    end
  end

  private
  def blog_params
    params.require(:blog).permit(:blog_name,:blog_introduction,:image).merge(user_id: current_user.id)
  end

end
