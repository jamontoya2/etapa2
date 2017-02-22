get '/ask/question' do
	if logged_in?
  	Question.create(question: params[:txt_question], user_id: current_user.id)
 		@questions = Question.all
   	erb :menu
  else
	erb :login
  end

end 

post '/answer/short' do
	quest = Question.find(params[:question_id])
	if quest
		ans = Answer.create(question_id: quest.id, user_id: current_user.id, answer: params[:text_answer])
  end
	  @questions = Question.all
	 	erb :menu 			
end

get '/show/questions/:id' do
	@quest = Question.find(params[:id])
		if @quest
			@answ = @quest.answers
    	erb :show_questions
  	end  
end

post '/answer/long' do
	quest = Question.find(params[:question_id])
		if quest
		 ans = Answer.create(question_id: quest.id, user_id: current_user.id, answer: params[:text_answer])
  	end
		redirect to ("/show/questions/#{quest.id}")	  			
end

get "/show/questions/user/:id" do
	user = User.find(params[:id])
	p @quest = user.questions 
	p @answ = user.answers
	erb :show_questions_user
end
   
get "/show/answers/user/:id" do
	user = User.find(params[:id])
	@quest = user.questions 
	@answ = user.answers
	erb :show_answers_user
end

post "/count/question/votes" do
	 quest = Question.find(params[:question_id])
	if  quest 
			Questionvote.create(question_id: quest.id, vote: true)	
		end		
   	if request.xhr?
    #AJAX
      	quest.questionvotes.length.to_s
   	else
    	#HTML
    @questions = Question.all
    erb :menu
   end
end

post "/count/answer/votes" do
	 answer = Answer.find(params[:answer_id])
	if  answer 
			Answervote.create(answer_id: answer.id, vote: true)	
		end		
   	
   	if request.xhr?
    #AJAX
      	answer.answervotes.length.to_s
   	else
    	#HTML
    @questions = Question.all
    erb :menu
   end
end



