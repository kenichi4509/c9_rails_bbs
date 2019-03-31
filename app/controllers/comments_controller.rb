class CommentsController < ApplicationController
  def create
    comment = Comment.new(comment_params)
    if comment.save
      redirect_to comment.board, flash: { notice: 'コメントを投稿しました'  }
    else
      flash[:comment] = comment
      flash[:error_messages] = comment.errors.full_messages
      redirect_back fallback_location: comment.board
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end


end
