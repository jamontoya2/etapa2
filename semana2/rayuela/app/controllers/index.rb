get '/' do
 
  erb :login

end

get '/play' do
	
	if Player.find_by(name: params[:player1]) == nil
		player_one = Player.create(name: params[:player1])
	  p player_one
	else
		player_one = Player.find_by(name: params[:player1])
  end 

	if Player.find_by(name: params[:player2]) == nil
		player_two = Player.create(name: params[:player2])
	else
		player_two = Player.find_by(name: params[:player2])
  end 
     
  @game = Game.create
  @game_player = GamePlayer.create(game_id: @game.id, player_id: player_one.id)
  @game_player = GamePlayer.create(game_id: @game.id, player_id: player_two.id)
   erb :play

end

post '/result' do
	 game_id = params[:game_id]
	 win  = params[:winner].to_i
	 score_p1 = params[:score_p1]
	 score_p2 = params[:score_p2]
	 
	 game = Game.find_by(id: game_id.to_i)
	 players = GamePlayer.where(game_id:game.id) 
   
   if win == 0
		game.update(winner: "Ambos perdieron", player_uno: 0, player_dos: 0)
	 elsif win == 1
		game.update(winner: "empate", player_uno: score_p1, player_dos: score_p2)
   elsif win == 2
   	player = Player.find_by(id: players[1].player_id)
  	game.update(winner: player.name, player_uno: score_p1, player_dos: score_p2)
   elsif win == 3
   	player = Player.find_by(id: players[0].player_id)
  	game.update(winner: player.name, player_uno: score_p1, player_dos: score_p2)
   end
end
