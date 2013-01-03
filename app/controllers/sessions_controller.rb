class SessionsController < ApplicationController
	layout "login"
	
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		respond_to do |format|

			if user && user.authenticate(params[:session][:password])
				if (user.approve == true)
					device_token = params[:session][:device_token]

					@apn_check = APN::Device.find_by_user_id(user.id)
					if @apn_check.present?
						if APN::Device.find_by_token_and_user_id(device_token,user.id).present?
						else
							if device_token.present?
								@apn_check.update_attributes!(:token => device_token)
								createDeviceGroup(@apn_check.id)
							end
						end
					else
						if device_token.present?
							puts "Create new token"
							@apn_device_token = APN::Device.find_by_token(device_token)
							if @apn_device_token.present?
								@apn_device_token.update_attributes(:user_id => user.id)
							else
								createDevice(device_token,user.id)
								@device_id = APN::Device.find_by_token(device_token).id
								createDeviceGroup(@device_id)
							end
						end
					end
					flash[:success] = t('flash.login')
					session[:user_id] = user.id
					user.update_attributes(:last_login => Time.now)
					if params[:remember_me] == "1"
					      	signin_always user
					    else        		
				        	sign_in user
				    end
					format.html {redirect_to root_path }	          
		      		format.json  { render json: user.as_json(:only => [:id,:fullname,:email,:remember_token]) } ## success
		      	else
		      		flash[:error]=  t("flash.unapprove") 
					format.html { redirect_to signin_path }
					format.json  { render json: Hash["status" => "unlogin","message" => "#{t("flash.unapprove")}"] }
		      	end ## approve
			else
					flash[:error] = t("flash.unlogin")
	          		format.html {redirect_to signin_path }	
	          		format.json  { render json: Hash["status" => "unlogin", "message" => "#{t("flash.unlogin")}"] }   
			end  ## authenticate
	   end ## respond_to

	end
			
	def destroy
		current_users ||=  current_user || User.find_by_id(params[:id])
		current_users.update_attributes(:last_logout => Time.now)
		sign_out
		flash[:success] = t('flash.logout')
		respond_to do |format|
      		format.html { redirect_to signin_path }
      		format.json { render json: Hash["message" => "Sign out success"] }   
    	end

	end

	private

	def createDeviceGroup(device_id)
		dg = APN::DeviceGrouping.new
		dg.group_id = 1
		dg.device_id = device_id
		dg.save
	end

	def createDevice(notification_token,user_id)
		device = APN::Device.new
		device.token = notification_token
		device.app_id = 1
		device.user_id = user_id
		device.save
	end

end