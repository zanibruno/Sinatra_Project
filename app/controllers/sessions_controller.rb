# frozen_string_literal: true


class SessionsController < ApplicationController
  get '/login' do
    if logged_in?
      redirect '/appointments'
    else
      @failed = false
      erb :login
    end
  end


  post '/login' do
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/appointments'
    else
      @failed = true
      redirect '/login'
    end
  end

  get '/logout' do
    session[:user_id] = nil

    session.clear

    erb :login
  end

  post '/signup' do
    user = User.new(name: params[:name], username: params[:username], password: params[:password])
    binding.pry
    user.save
      redirect '/login'
    end



  get '/signup' do
    redirect '/appointments' if logged_in?
    erb :signup
  end

  get '/bookappt' do
    erb :newappts
  end

  post '/bookappt' do
     appointment = Appointment.new(name: params[:name], user_id: current_user.id)
     appointment.save
     redirect '/appointments'
  end


end
