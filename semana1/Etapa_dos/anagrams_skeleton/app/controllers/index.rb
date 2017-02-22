get '/' do
  erb :index
end

get '/:new_word' do
	@new_word = params[:new_word]
   @canon = Word.where(canonical: canonico(@new_word))
  erb :word
end

post '/new_word' do
  redirect to ("/#{params[:user_word]}")
end


def canonico(word)
 	word.chars.sort.join
 end		


