
get '/' do
  puts "Este es un get a (/)"
  puts "Esto es lo que vale Params: #{params.inspect}"
  erb :index 	
end

get '/cool_url' do
	puts "Este es un Get a /cool_url"
	puts "Esto es lo que vale Params: #{params.inspect}"
	erb :get_cool_url
end

post '/cool_url' do
	puts "Este es un POST a /cool_url"
	puts "Esto es lo que vale Params: #{params.inspect}"
	erb :post_cool_url
end

