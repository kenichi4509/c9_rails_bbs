class BoardsController < ApplicationController
  before_action :target_board, only: %i[show edit update destroy]


  def index
    @boards = Board.all.order('created_at desc')
  end

  def new
    @board = Board.new
  end

  def create
    board = Board.create(board_params)
    redirect_to board
  end

  def show
  end

  def edit
  end

  def update
    @board.update(board_params)
    redirect_to board_path
  end

  def destroy
    @board.delete
    redirect_to boards_path
  end

  private 

  def board_params
    params.require(:board).permit(:name, :title, :body)
  end

  def target_board
    @board = Board.find(params[:id])
  end


end
