class SessionsController < ApplicationController
  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to mypage_path
    else
      #render 'home/index'
      redirect_to users_path, flash: { notice: "ログインに失敗しました"}
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
