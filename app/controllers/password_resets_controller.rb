class PasswordResetsController < ApplicationController
  #layout "resetpassword"
  def new
  end
  
  def create
	user = User.find_by_email(params[:email])
	if user
	user.send_password_reset
	respond_to do |format|
	format.html { redirect_to signin_path , :notice => "Email sent with password reset instructions." }
	format.json { render :text => "Email sent with password reset instructions."}
	end
	else
	respond_to do |format|
	flash[:warning] = "Email #{params[:email]} wasn't found.  Perhaps you used a different one?  Or never registered or something?"
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
