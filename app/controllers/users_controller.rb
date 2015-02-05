class UsersController < ApplicationController

  def new
    @user = User.new
    respond_to do |format|
      format.js{}
      format.html
    end
  end

	def create
		@user= User.new(user_params)

		if @user.save
			redirect_to users_path, :notice => "Signed up!"
		else
			respond_to do |format|
				format.html { render action: "new" }
			end
		end
	end


	def index
		respond_to do |format|
      format.html # index.html.erb

      format.js {}
    end
  end

private

def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
