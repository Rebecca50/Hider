class CommentsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :update, :delete]


  def index

  end
  
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new(:post=>@post)
  end
  
  def create
    post = Post.find(params[:post_id])   
    new_comment = Comment.create(comment_params)
    post.comments << new_comment
    current_user.comments << new_comment
    redirect_to post_path(post)
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def update
    post = Post.find(params[:post_id])
    edited_comment = Comment.find(params[:id])
    edited_comment.update(comment_params)
    redirect_to post_path(post)   
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def destroy
    post = Post.find(params[:post_id])
    Comment.delete(params[:id])
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end

end

