class SessionsController < ApplicationController

  def new
    respond_to do |format|
      format.js
    end
  end

  def check_username
   @user = User.find_by_username(params[:username])
    respond_to do |format|
      format.json { render :json => @user.present? }
    end
  end

  def create
  if params[:provider] == "facebook"
    auth = request.env["omniauth.auth"]
    user = User.where(:provider => auth['provider'],
    :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
  else
    user = User.authenticate(params[:username], params[:password])
  end
    if user
      session[:user_id] = user.id
      flash[:success] = "Signed in Successfully"
      redirect_to users_path, :success => "Logged in!"
    else
      flash[:alert] = "Invalid username or password"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Logged out!"
    redirect_to root_path
  end
end
