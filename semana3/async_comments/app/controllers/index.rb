get '/' do
  @comments = Comment.all
  erb :index
end


post '/record' do
  array = []
  haste = []
  array = params.values.to_a
  haste = array.to_h
  haste.each do |key, value|
  	Comment.create(comment: key, author: value)
  end
  array = []
  haste = []
end