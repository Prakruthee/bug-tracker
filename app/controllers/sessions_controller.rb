class SessionsController < ApplicationController

  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      flash[:success] = "Signed in Successfully"
      redirect_to users_path, :success => "Logged in!"
    else
      flash[:alert] = "Invalid email or password"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "user has been Successfully Logged out"
    redirect_to root_path
  end
end