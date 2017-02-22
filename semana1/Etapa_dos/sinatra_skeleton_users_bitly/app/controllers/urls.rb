get '/urls' do  
  @urls = Url.all.sort 
  erb :url_index
end

post '/urls' do  
  if logged_in?
      @url = Url.new(user_id: "#{current_user.id}", long_url: params[:long_url])  
      if @url.save
         redirect to ("/users/#{current_user.id}")
      else
         @urls = Url.all.sort  
         erb :url_index
      end
  else 
      @url = Url.new(long_url: params[:long_url])  
      if @url.save
         redirect to '/urls'
       else
         @urls = Url.all.sort  
         erb :url_index
      end
  end 
end




 

#   @url = Url.new(long_url: params[:long_url])  
    
#   if @url.save
#     if logged_in?
#       p "estas loggeado"
#      redirect to ("/users/#{current_user.id}")
#     else
#       p "no estas loggeado"
#       #redirect to ("/urls")
#      # redirect to ("/")
    
#     end     
#   else
#     @urls = Url.all.sort  
#     #erb :secret
#   end
# end

get '/urls/:id' do
 	@url = Url.find(params[:id])
  @url.click_count += 1
  @url.save
  redirect to ("#{@url.long_url}")
end
