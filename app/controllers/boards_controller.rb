class BoardsController < ApplicationController
  before_action :target_board, only: %i[show edit update destroy]


  def index
   # @boards =  Board.find_by_sql("SELECT * FROM boards LIMIT 20,10")
   # @boards = Board.limit(10).limit(20).order('created_at desc')
    @boards = params[:tag_id].present? ? Tag.find(params[:tag_id]).boards : Board.all
    @boards = @boards.page(params[:page]).order('created_at desc')
    
    
  end

  def new
    if current_user
      @board = Board.new(name: current_user.name)
    else
      @board = Board.new(flash[:board]) 
    end
    
  end

  def create
    board = Board.new(board_params)
    if board.save
      flash[:notice] = "「#{board.title}」の掲示板を作成しました"
      redirect_to board
    else
      redirect_to new_board_path, flash: {
        board: board,
        error_messages: board.errors.full_messages
      }
    end
  end

  def show
    if current_user
      @comment = Comment.new(board_id: @board.id, name: current_user.name)
    else
      @comment = Comment.new(board_id: @board.id)
    end
  end

  def edit
  end

  def update
    @board.update(board_params)
    redirect_to board_path, flash: { notice: "編集しました"}
  end

  def destroy
    @board.destroy
    redirect_to boards_path, flash: { notice: "「#{@board.title}」の掲示板を削除しました"}
  end

  private 

  def board_params
    params.require(:board).permit(:name, :title, :body, tag_ids: [])
  end

  def target_board
    @board = Board.find(params[:id])
  end


end
