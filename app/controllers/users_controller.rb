class UsersController < ApplicationController

    # gives me (renders) a login form
    get "/login" do
        erb :'/users/login'
    end
    

    # recieves param data from login form
    post "/login" do
        @user = User.find_by(email: params[:email])
        
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id

            flash[:message] = "Hey!"
            redirect to "/users/#{@user.id}"
        else 
            flash[:error] = "Unrecognized email/password."
            redirect_if_not_logged_in
        end

    end 


    # the user's show route
    get "/users/:id" do 
        # binding.pry
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end 

    get '/signup' do 
        erb :'/users/signup'
    end 

    post '/users' do 
        @user = User.create(params)
        session[:user_id] = @user.id # route to post sign up that creates user + adds key/value to sessions

        redirect "/users/#{@user.id}" # takes user to profile
    end 


    get '/logout' do
        session.clear
        redirect '/' 
    end 




end