class ApplicationController < ActionController::Base
  protect_from_forgery

 #  before_filter :require_login	

 #  def require_login
	# 	unless session[:user_id] || request.path == "/"
	# 		redirect_to "/"
	# 	end
	# 	binding.pry
	# end
  #learn more about the sessions and filters in Action Controller Overview
  #before_filter :require_login, :except => [:login, :do_login]


 #  def require_login
 #  	if[:session]
	# end

end
