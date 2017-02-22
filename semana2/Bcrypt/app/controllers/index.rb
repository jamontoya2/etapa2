get '/' do
  session.clear
  @notlog = params[:notlog]
  erb :welcome
end

get '/login' do
  erb :login
end  

get '/signup' do
  erb :signup 
end

get '/logout' do
  session.clear
  erb :welcome
end

before '/users/:id' do
  unless session[:user_id]
    redirect to '/login'
  end
  @user = User.find(params[:id])
end

get '/users/:id' do
  erb :secret
end


post '/signup' do
	@user = User.new(name: params[:user_name], email: params[:user_email], password: params[:user_password])
  if @user.save 
  	 @error = false
  	 session[:user_id] = @user.id
     redirect to ("/users/#{@user.id}")
  else
     @error = true
     erb :signup
  end
end

post '/login' do  
  user = User.authenticate(params[:user_mail], params[:user_password])      
  	if user != nil 
      session[:user_id] = user.id
      redirect to ("/users/#{user.id}")
   	else 
       @error = true
       erb :login
    end		
end

get '/update' do
  puts "IN GET /update"
  puts "SESSION ID:#{session[:user_id]}"
  if logged_in?
    erb :update_user
  else
    notlog = true
    redirect to ("/?notlog=#{notlog}")
  end
end

post '/user/update' do
  puts "SESSION ID: #{session[:id]}"
 user = User.authenticate(current_user.email,params[:password])

  if user
    user.name = params[:name] if params[:name] != ""
    user.email = params[:email] if params[:email] != ""
    user.password = params[:password_new] if params[:password_new] != ""
    if user.save 
      redirect to ("/users/#{user.id}")      
    else
      redirect to ('/update?falla=true')
    end
  else
    @falla = true
    erb :update_user
  end
end

get '/delete' do
  puts "IN GET /delete"
  if logged_in?
    erb :delete_user
  else
    notlog = true
    redirect to ("/?notlog=#{notlog}")
  end
end

post '/user/delete' do
  user = User.authenticate(current_user.email,params[:password])
  if user
    if User.delete(user.id)
      session.clear
      redirect to ("/")      
    else
      redirect to ('/delete?falla=true')
    end
  else
    @falla = true
    erb :delete_user
  end
end






   







