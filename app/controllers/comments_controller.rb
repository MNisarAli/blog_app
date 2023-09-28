class CommentsController < ApplicationController
  before_action :set_post, only: %i[new create]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.author = current_user

    if @comment.save
      redirect_to user_post_path(@post.author, @post)
      flash[:notice] = 'Comment was successfully added.'
    else
      render :new
      flash[:alert] = 'Comment was not added, please add some text.'
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
