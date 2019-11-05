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









end
