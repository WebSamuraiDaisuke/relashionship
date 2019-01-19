class UsersController < ApplicationController
  def index
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    #byebug
    @user = User.new(user_params)
    if @user.save
      flash[:succeed] = 'User is created'
      redirect_to root_path
    else
      flash[:error] = 'Save is failed'
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :role, :bio)
  end
end
