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

get '/' do
   erb :welcome
 end

get '/users/:id' do
  erb :secret
end

post '/signup' do
	@user = User.new(name: params[:user_name], email: params[:user_email], password: params[:user_password])
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
  user = User.authenticate(params[:user_mail], params[:user_password])      
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






   







