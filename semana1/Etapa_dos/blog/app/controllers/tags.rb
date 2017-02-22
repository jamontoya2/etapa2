
get '/tags' do
  erb :search_tags
end

post '/tags/search' do
  tag = Tag.find_by("name = ?", params[:name])
  unless tag == nil
   @post = tag.posts
  end
  @message = "posts with the hashtag ##{params[:name]}"
  erb :search_tags
end