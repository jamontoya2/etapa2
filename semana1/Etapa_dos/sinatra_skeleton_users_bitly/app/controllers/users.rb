before '/users/:id' do
	unless session[:id]
    redirect to '/login'
  end
  @user = User.find(params[:id])
end


get '/login' do
  erb :login
end  

get '/signup' do
	erb :signup	
end

get '/users/:id' do
  @urls = Url.where(user_id: session[:id])
  erb :secret
end

# get '/users_perfil/:id'
  
#   @urls = Url.where(user_id: session[:id])
#   erb: perfil
# end

post '/signup' do
	@user = User.new(name: params[:name], email: params[:email], password: params[:password])
  if @user.save 
  	 @error = false
  	 session[:id] = @user.id
     redirect to ("/users/#{@user.id}")
  else
     @error = true
     erb :signup
  end
end

post '/login' do  
  user = User.authenticate(params[:email], params[:password])      
  	if user != nil 
      session[:id] = user.id
      redirect to ("/users/#{user.id}")
    else 
       @error = true
       erb :login
    end		
end

get '/logout' do
  session.clear
  erb :welcome
end
