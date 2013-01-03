class PasswordResetsController < ApplicationController
  force_ssl
  #layout "resetpassword"
  def new
  end
  
  def create
	user = User.find_by_email(params[:email])
    respond_to do |format|
    	if user
      @new_password = user.reset_password
      puts @new_password
      UserMailer.password_reset(user,@new_password).deliver

    	   format.html { redirect_to signin_path , :notice => t("flash.sentemail") + " #{params[:email]}" }
    	   format.json { render :text => "Email sent with password reset instructions."}
    	else
      	flash[:warning] = "Email #{params[:email]} " + t("flash.email")
      	format.html { redirect_to new_password_reset_path}
        format.json { render :text => "Email wasn't found.'"}
    	end
    end
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  
  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      respond_to do |format|
	  flash[:warning] = "Password reset has expired."
	  format.html { redirect_to new_password_reset_path }
		end

    elsif @user.update_attributes(params[:user])
    respond_to do |format|
      format.html {redirect_to signin_path, :notice => "Password has been reset!"}
      format.json { render :text => "Password has been reset."}      
    end
    else
      render :edit
    end
  end
  

  
end
