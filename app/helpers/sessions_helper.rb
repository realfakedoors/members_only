module SessionsHelper

	def log_in(user)
		session[:user_id] = user.id
	end

	def current_user
		if (user_id = session[:user_id])
			@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
			user = User.find_by(id: user_id)
			log_in user
			user.remember_user
			@current_user = user
		end
	end

	def logged_in?
		!current_user.nil?
	end

	def log_out
		session.delete(:user_id)
		cookies.delete(:user_id)
		@current_user = nil
	end

end