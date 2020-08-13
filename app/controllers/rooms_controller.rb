class RoomsController < ApplicationController

    # lets a user view rooms if logged in
    get '/rooms' do 
        if logged_in?
            @rooms = current_user.rooms.all
            erb : 'rooms/rooms'
        else 
            not_logged_in_redirect
        end
    end 

    # user has to create a name for a room they create - it can't be empty
    post '/rooms' do 
        if params[:name].empty?
            flash[:message] = "Woah there buddy. Enter a name for your room!"
            rooms_redirect
        else 
            @user = current_user
            @rooms = Rooms.create(name:params[:name], user_id:@user.id)
            rooms_redirect 
        end 
    end 

    # shows the rooms available 
    get '/rooms/:id' do 
        if logged_in?
            @rooms = Rooms.find(params[:id])
            erb :'rooms/show_rooms'
        else 
            not_logged_in_redirect
        end 
    end 

    # user can't change a room with 0 content in it 
    patch '/rooms/:id' do 
        if !params[:name].empty?
            @room = Rooms.find(params[:id])
            @room.update(name:params[:name])
            flash[:message] = "Great! Your room's been updated!"
            rooms_redirect
        else 
            flash[:message] = "You can't leave it blank! :( "
            redirect to "/rooms/#{params[:id]}/edit"
        end 
    end 

    





end 