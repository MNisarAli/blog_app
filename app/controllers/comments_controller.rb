class CommentsController < ApplicationController
  before_action :set_post, only: %i[new create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.author = current_user

    render :new unless @comment.save

    redirect_to user_post_path(user_id: @post.author.id, id: @post.id)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
