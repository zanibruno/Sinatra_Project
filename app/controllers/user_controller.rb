class UserController < ApplicationController

  post '/signup' do
    user = User.new(name: params[:name], username: params[:username], password: params[:password])
    user.save
      redirect '/login'
    end



  get '/signup' do
    redirect '/appointments' if logged_in?
    erb :signup
  end

end
