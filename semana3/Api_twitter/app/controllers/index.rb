get '/' do
  erb :index
end

post '/tweet' do
  CLIENT.update(params[:text])
end

post '/fetch' do
  user = User.find_by_name(params[:name])
  if user == nil
    user = User.create(name: params[:name])
  end
      return "twitter"
  end

get '/db/:username' do
  @user = User.find_by_name(params[:username])
  erb :tweets
end

get '/twitter/:username' do
  @user = User.find_by_name(params[:username])
    CLIENT.user_timeline(@user.name).each do |tweet|
      tweets = Tweet.where(id_tweet: tweet.id).count  
        if tweets == 0
          Tweet.create(user_id: @user.id, id_tweet: tweet.id, text: tweet.text, post_date: tweet.created_at)
        end
  end
  return "true"
end
