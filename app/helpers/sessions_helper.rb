module SessionsHelper
	
	def sign_in(user)
		cookies.permanent.signed[:remember_token] = [user.id, user.salt]
		current_user = user
	end

	#setter method
	def current_user=(user)
		@current_user = user
	end	

	def current_user
		# either new user for page or from the cookie
		# below equivalent to @current_user = @current_user || user_from remember_token
		# @current_user is only assigned user_from_remember_token if undefined, i.e. only calls 1st time
		@current_user ||= user_from_remember_token
	end
		
	def signed_in?
		!current_user.nil?
	end
	
	def sign_out
		cookies.delete(:remember_token)
		self.current_user = nil
		
	end
	
	def current_user?(user)
		user == current_user
	end
		
	
	private 
	
	def user_from_remember_token
		#* is used to unwrap above array [user.id, user.salt]
		User.authenticate_with_salt(*remember_token)
	end

	def remember_token
		cookies.signed[:remember_token] || [nil, nil]
	end

	def authenticate
		deny_access unless signed_in?
	end	

	def deny_access
		store_location
		redirect_to signin_path
		flash[:notice] = "Please sign in to access this page" 
	end

	def store_location
		session[:return_to] = request.fullpath
	end
	
	def redirect_back_or(default)
		redirect_to(session[:return_to] || default) 
		clear_return_to
	end
	
	def clear_return_to
		session[:return_to] = nil
	end
	
end
