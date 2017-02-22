require 'sinatra'
require "sinatra/activerecord"
require './models/user.rb'


set :database, {adapter: "sqlite3", database: "db/users.sqlite3", pool:30}



get '/' do
  erb :index
end 


get '/users/:id' do
  @user = User.find(params[:id])
  erb :profile
end

get '/users' do
  @users = User.all
  erb :users
end 


post '/users' do
  #capturamos los valores del formulario con 'params'

  name  = params[:name]
  email = params[:email]
  #creamos una instancia de la clase User con sus atributos necesarios 
  user = User.new(name: name, email: email)
  #si el usuario se guardo en la BD, redirige a su perfil, de otra forma
  #vuelve a mostrar el formulario
  
  if user.save
    redirect to ("/users/#{user.id}")
  else
    erb :index
  end
end 


