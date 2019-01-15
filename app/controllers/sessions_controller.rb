class SessionsController < ApplicationController
  def new
  end

  def create
    # ここでsession_paramsを使う場合はどういうコードが必要か？
    email = params[:session][:email]
    password = params[:session][:password]
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

  def session_params
    params.require(:session).permit(:email, :password)
  end

  def login(email, password)
    @user = User.find_by(email: email)
    #if @user && @user.authenticate(password)
    if @user&.authenticate(password) # ここぼっち演算子を使えるのはなぜか？ぼっち演算子とは？
      session[:user_id] = @user.id
      true
    else
      false
    end
  end
end