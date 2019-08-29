class SessionController < ApplicationController
  before_action :login_redirect,only: [:new,:create]
  def new
  end
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to root_path
    else
      flash[:error] = "There was something wrong with login information"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are successfully logged out"
    redirect_to login_path
  end


  private

  def login_redirect
    if logged_in?
      flash[:error] = "You are already in a logged in state"
      redirect_to root_path
    end
  end
end
