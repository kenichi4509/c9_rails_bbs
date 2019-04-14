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
    @comment = Comment.find_by(name: @current_user.name)
  end

  def update
    @comment = Comment.find_by(name: @current_user.name)
    @comment.update(comment_params)
    redirect_to("/boards/#{@comment[:board_id]}", flash: { notice: "コメントを編集しました" })
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to comment.board, flash: { notice: "コメントを削除しました" }
  end

  private

  def comment_params
    params.require(:comment).permit(:board_id, :name, :comment)
  end


end
