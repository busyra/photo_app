class UsersController < ApplicationController
	# display all users
	def index
		@users = User.all
	end
	# creates new user
	def new
		@user = User.new
	end

	# creates new user
	def create
		@user = User.new(user_params)
		# makes sure user has all params else re renders page blank
		if @user.save
			redirect_to root_path, notice: "Successfully signed up!"
		else
			render :new
		end
	end

	# for user profil page
	def show
		@user = User.find(params[:id])
	end
	#  deletes user
	def destroy
		@user= User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	private 
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
