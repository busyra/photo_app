class SessionsController < ApplicationController
	def new	
	end
	# will log in new user with bcrypt password
	def create
		user = User.find_by(email: params[:login][:email])

		if user && user.authenticate(params[:login][:password])
			session[:user_id] = user.id.to_s
			redirect_to root_path
		else
			render :new
		end

	end
	# will log out user
	def destroy
		session.delete(:user_id)
		redirect_to login_path
	end

end


