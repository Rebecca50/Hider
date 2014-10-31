class BlogController < ApplicationController

  def index
    @category = Category.find_by_url_slug(params[:url_slug]) if params[:url_slug]

    if @category
      @posts=@category.posts.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)
    else
      @posts=Post.order("created_at DESC").paginate(:page => params[:page], :per_page => 10)      
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(:post=>@post)
  end

end

