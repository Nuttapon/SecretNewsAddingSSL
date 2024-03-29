module SessionsHelper

	def sign_in(user)
      current_user = user
	  cookies[:remember_token] = { value:  user.remember_token, expires: 5.hours.from_now }                                                                 
      cookies[:current_user] = user.id    
  	end

    def signin_always(user)
      cookies.permanent[:remember_token] = user.remember_token
      current_user = user
    end

    def signed_in?
      !current_user.nil? 
    end

  	def current_user=(user)
  		@current_user = user 		
  	end

  	def current_user
    	@current_user ||= User.find_by_remember_token!(cookies[:remember_token]) if cookies[:remember_token]
  	end

    def current_user
      @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    end

    def sign_out
      current_user = nil
      session[:user_id] = nil
      reset_session
      cookies.delete(:remember_token)
    end

    def current_user?(user)
      user == current_user
    end

    def redirect_back_or(default)
      redirect_to(session[:return_to] || default)
      session.delete(:return_to)
    end

    def store_location
      session[:return_to] = request.fullpath
    end

    def signed_in_user
      unless signed_in?
        store_location
        #redirect_to signin_path, notice: "Please sign in."
        respond_to do |format|
          format.html { redirect_to signin_path, notice: t("flash.require") }
          format.json { render json: Hash["message" => "Please sign in."] }
        end
      end
    end

end
