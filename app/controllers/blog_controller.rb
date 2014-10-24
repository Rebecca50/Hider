class BlogController < ApplicationController
  def index
    @category = Category.find_by_url_slug(params[:url_slug]) if params[:url_slug]

    if @category
      @posts=@category.posts.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    else
      @posts=Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 5)
    end
  end

  def show
    @post=Post.find(params[:id])
  end

end

