class CommentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_back(fallback_location: root_path, notice: 'Comment was'\
        ' successfully created.')
    else
      redirect_back(fallback_location: root_path, notice: 'Text of'\
        " comment can't be blank.")
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :user_id, :hotel_id)
  end
end
