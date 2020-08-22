class PostsController < ApplicationController

    # implements C.R.U.D by: 


    # READING : model gets all posts from db
    get '/posts' do
        @posts = Post.all 
        erb :'posts/index'
    end 

    # CREATING : allows user to make a new post
    get '/posts/new' do
        if logged_in?
            erb :'/posts/new'
        else 
            flash[:error] = "Log in to post!"
            redirect "/"
        end 
    end 

    post '/posts' do
        @post = Post.new(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
        
        if @post.save # varifies is input is legit, .save triggers validation
            flash[:message] = "Woohoo! Your post is up!"
            redirect "/posts/#{@post.id}"
        else 
            flash[:error] = "Couldn't create post [#{@post.errors.full_messages.to_sentence}]"
            redirect "posts/new"
        end 
    end 

    # route for individual post
    get '/posts/:id' do
        @post = Post.find(params[:id])
        
        erb :"/posts/show"
    end 


    # UPDATING : user can edit their post but no one else's
    get '/posts/:id/edit' do
        @post = Post.find(params[:id])

        if authorized_to_edit?(@post)
            erb :'/posts/edit'
        else 
            flash[:error] = "You can't edit this post!"
            redirect '/posts'
        end 
    end 

    patch '/posts/:id' do
        @post = Post.find(params[:id])

        @post.update(title: params[:title], image_url: params[:image_url], description: params[:description])

        redirect "/posts/#{@post.id}"
    end 

    # DELETING : uses id to find the post the user wants to delete
    delete '/posts/:id' do
        @post = Post.find(params[:id])
        @post.destroy

        redirect '/posts'
    end 






end 