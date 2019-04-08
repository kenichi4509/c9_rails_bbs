class UsersController < ApplicationController
  
  def index
  end
  
  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.create(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      redirect_to new_user_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      }
    end
    
  end

  def me
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :image)
  end
end
