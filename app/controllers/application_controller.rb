class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  rescue_from CanCan::AccessDenied do |exception|
    #redirect_to hotnews_index_path, :alert => exception.message
    redirect_to hotnews_index_path, :alert => exception.message
  end

  def checkadmin(admin)
  	if User.find(admin).admin?
  		true
  	else
  		false
  	end
  end
end
