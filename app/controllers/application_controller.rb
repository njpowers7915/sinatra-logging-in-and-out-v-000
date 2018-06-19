require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
      @user = User.find_by(username: params["username"])
      if @user.nil?
          erb :error
      else
          session[:user_id] = @user.id
<<<<<<< HEAD
          redirect '/account'
=======
          erb :account
>>>>>>> 2968bc9ac4e9d30df8e1248fdb594c5a8a441240
      end
  end

  get '/account' do
      #@user = User.find_by(id: session[:user_id])
      @user = Helpers.current_user(session)
      if Helpers.is_logged_in?(session) == false
          erb :error
      else
          session[:user_id] = @user.id
<<<<<<< HEAD
          erb :account
=======
          redirect '/account'
>>>>>>> 2968bc9ac4e9d30df8e1248fdb594c5a8a441240
      end
  end

  get '/logout' do
    session.clear

    redirect '/'
  end


end
