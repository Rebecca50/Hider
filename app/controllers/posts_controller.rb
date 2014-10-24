class PostsController < ApplicationController
  before_action :set_post, only: [:show,:edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @posts = current_user.posts.paginate(:page => params[:page], :per_page => 10)
    else
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    respond_with(@post)
  end

  def update
    @post.update(post_params)
    respond_with(@post)
  end

  def destroy
    @post.destroy
    respond_with(@post)
  end

  private
    def set_post
      @post = current_user.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, category_ids:[])
    end
end
