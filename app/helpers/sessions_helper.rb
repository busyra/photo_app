module SessionsHelper
	# needed to know when user is signed in
	def current_user
	  @current_user ||= User.find_by(id: session[:user_id])
	end
end
