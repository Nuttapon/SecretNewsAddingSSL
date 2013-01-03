class UserMailer < ActionMailer::Base
	
  default from: "onlinehoroscopez@gmail.com"
  def password_reset(user,new_password)
  	@user = user
  	@new_password = new_password
  	mail(:to => user.email, :subject => "Password Reset")
  end
  
  # def activate(user)
  # 	@user = user
  # 	mail(:to => user.email, :subject => "Account activation at Authenticate", :from => "OnlineHoroscopez@gmail.com")
  # end

end
