class UsersController < ApplicationController

    # gives me (renders) a login form
    get "/login" do
        erb :'users/login'
    end
    
    # recieves param data from login form
    post "/login" do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            binding.pry
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else 
            # show an error message
            redirect '/login'
        end

    end 

    # show route
    get "/users/:id" do 
        @user = User.find_by(id: params[:id])
        erb :'users/show'
    end 

    get '/signup' do 
        erb :'/users/signup'
    end 

    


end
#     get '/signup' do 
#         if Helpers.is_logged_in?(session)
#             redirect to '/posts'
#         end 
#         erb :'users/create_user'
#     end

#     post '/signup' do
#         if !(params.has_value?(""))
#             user = User.create(params)
#             session["user_id"] = user.id 
#             redirect to '/posts'
#         else 
#             redirect to '/signup'
#         end 

#     end 

#     get '/login' do
#         if Helpers.is_logged_in?(session)
#             redirect to '/posts'
#         end 

#         erb :'users/login'
#     end 

#     get '/users/:slug' do
#         @user = User.find_by_slug(params[:slug])
#         if !@user.nil? 
#             erb :'/user/user_posts'
#         else 
#             redirect to '/login'
#         end 
#     end 

#     get '/logout' do
#         if Helpers.is_logged_in(session)
#             session.clear
#         else 
#             redirect to '/' 
#         end
        
#         redirect to '/login'

#     end 