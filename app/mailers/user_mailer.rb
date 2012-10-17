class UserMailer < ActionMailer::Base
 
  def password_reset(user)
  @user = user
  mail(:to => user.email, :subject => "Password Reset", :from => "OnlineHoroscopez@gmail.com")
  end
  
  def activate(user)
  @user = user
  mail(:to => user.email, :subject => "Account activation at Authenticate", :from => "OnlineHoroscopez@gmail.com")
  end

end
