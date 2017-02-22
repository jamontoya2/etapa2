#send menu
get '/menu/:id' do
  @user = User.find(params[:id])
  erb :index
end  

#send question
get '/deck/send' do
	@round = Round.create(user_id: params[:user_id])
	deck = Deck.find(params[:id_deck])
	@round_deck = RoundDeck.create(round_id: @round.id, deck_id: deck.id)
  @card = Card.where(deck_id: deck.id)
 	@answer = Answer.all 
 	erb :show_questions
end

#analize answer
post '/play/:id' do 
	count_good = 0
	count_fail = 0
	answers = params["card"]
  user = params[:user_id]
  round = RoundDeck.find(params[:id])
  	answers.each do |key, value|
   	 x = Answer.find_by(id: key)
  	 (x.answer_ok == value) ? count_good += 1 : count_fail += 1 
    end
  Guess.create(round_id: round.round_id, tries_good: count_good, tries_fail: count_fail)
  redirect to ("/users/#{user}")
end


