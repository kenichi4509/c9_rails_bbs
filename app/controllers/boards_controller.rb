class BoardsController < ApplicationController
  before_action :target_board, only: %i[show edit update destroy]


  def index
   # @boards =  Board.find_by_sql("SELECT * FROM boards LIMIT 20,10")
   # @boards = Board.limit(10).limit(20).order('created_at desc')
    @boards = Board.page(params[:page]).order('created_at desc')
    
  end

  # def page
  #  page = Board.find(params[:id])

   #   index


 # end


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
