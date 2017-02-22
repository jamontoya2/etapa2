helpers do
  def current_user  
    if session[:id]
  	  User.find(session[:id])
  	else
  	  nil
  	end
  end

  def logged_in?
  	current_user ? true : false
 end
end
