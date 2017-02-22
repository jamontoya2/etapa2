before '/users/:id' do
	unless session[:id]
    redirect to '/login'
  end
  @user = User.find_by(params[:id])
end

get '/' do
  erb :login
end

get '/login' do
  erb :login
end  

get '/users/:id' do
  @user = User.find(params[:id])
  round = Round.where(user_id: @user.id)
  @deck_round = RoundDeck.where(round_id: round.ids)
  @deck = Deck.where(id: @deck_round)  
  @guess = Guess.where(round_id: round.ids)
  erb :perfil
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
  erb :login
end


 
 