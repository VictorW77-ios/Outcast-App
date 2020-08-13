require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views' 
    enable :sessions
    set :session_secret, 'password_security'
  end

  get "/" do
    if !logged_in?
      erb :index, :layout => : 'not_logged_in_layout'
    else 
      landing_page_redirect
    end
  end

  helpers do 
    def logged_in?
      !!session[:user_id]
    end

    def not_logged_in_redirect 
      if !logged_in?
        redirect "/login"
      end 
    end 

    def landing_page_redirect 
      redirect to "/posts"
    end

    def rooms_redirect 
      redirect to "/rooms"
    end

    def current_user
      User.find(session[:user_id])
    end
  end



  

end
