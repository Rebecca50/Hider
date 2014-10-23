class BlogController < ApplicationController
  def index
    @category = Category.find_by_url_slug(params[:url_slug]) if params[:url_slug]

    if @category
      @posts=@category.posts.order("created_at DESC")
    else
      @posts=Post.order("created_at DESC")
    end
  end

  def show
    @post=Post.find(params[:id])
  end

end
