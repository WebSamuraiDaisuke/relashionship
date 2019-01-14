class SessionsController < ApplicationController
  def new
  end

  def create
    @session = session_params
  end

  def destroy
  end

  private

  def session_params
    params.require(:session).permit(:name, :password)
  end
end
