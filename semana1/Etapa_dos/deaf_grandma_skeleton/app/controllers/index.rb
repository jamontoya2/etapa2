get '/' do
  @abuelita = params[:abuelita]
  
  erb :index
  # Visita app/views/index.erb
end


post '/abuelita' do
  user_input = params[:user_input]
  if user_input.upcase && user_input == "BYE TQM" 
    resp = "BYE MIJITO"
  elsif user_input == user_input.downcase
    resp = "NO, NO DESDE 1983"
  elsif user_input == user_input.upcase
  	resp = "HUH?! NO TE ESCUCHO, HIJO!"
  end	
   redirect to ("/?abuelita=#{resp}") 
end


  
