class SessionsController < ApplicationController
  def new
  end

  def create
    # byebug
    email = params[:email]
    password = params[:password]
    if login(email, password)
      flash[:success] = 'ログインに成功しました'
      redirect_to root_path
    else
      flash[:danger] = 'ログインに失敗しました'
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end

  private

  # def session_params
  #   params.require(:session).permit(:email, :password)
  # end

  def login(email, password)
    byebug
    @user = User.find_by(email: email)
    if @user&.authenticate(password) && @user.role == 'Admin'
      session[:user_id] = @user.id
      session[:role] = 'Admin'
      true
    else
      false
    end
  end
end