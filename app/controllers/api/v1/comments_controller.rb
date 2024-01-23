class Api::V1::CommentsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.includes(:author)
    render json: @comments
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user

    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
