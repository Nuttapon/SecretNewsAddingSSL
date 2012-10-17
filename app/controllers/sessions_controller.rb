class SessionsController < ApplicationController
	layout "login"

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
				flash[:success] = "Log in"
				session[:user_id] = user.id
				user.update_attributes(:last_login => Time.now)
						if params[:remember_me] == 1
				      			signin_always user
				      		else        		
			        			sign_in user
			        	end
				respond_to do |format|
					format.html {redirect_to root_path }	          
	      			format.json  { render json: user.as_json(:only => [:id,:fullname,:email,:remember_token,:activated]) }
        		end
		else
				flash[:error] = 'Invalid email/password combination'
				respond_to do |format|	
          			format.html {redirect_to signin_path }	
          			format.json  { render json: Hash["message" => "Invalid email/password combination"] }   
          		end 
		end
	end
			
	def destroy
		current_user.update_attributes(:last_logout => Time.now)
		sign_out
		flash[:success] = "Sign out success"
		respond_to do |format|
      		format.html { redirect_to signin_path }
      		format.json { render json: Hash["message" => "Sign out success"] }   
    	end
    	
	end
end