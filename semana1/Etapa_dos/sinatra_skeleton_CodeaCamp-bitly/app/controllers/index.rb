get '/' do
  @urls = Url.all.sort  
  erb :index
end



post '/urls' do
  
    @url = Url.new(original: params[:user_url])  
    
    if @url.save
      redirect to @url
    else
      @urls = Url.all.sort  
      erb :index
    end     
end

get '/urls/:id' do
 	@url = Url.find(params[:id])
    @url.click_count += 1
    @url.save
    redirect to ("#{@url.original}")
end

