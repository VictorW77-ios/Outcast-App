class PostsController < ApplicationController

    get '/posts' do
        if Helpers.is_logged_in?(session)
            @posts = post.all 
            erb :'/posts/posts'
        else 
            redirect to '/users/login'
        end
    end 

    get '/posts/new' do
        user = Helpers.current_user(session)
        if user.nil?
            redirect to '/login'
        else 
            erb :'posts/create_post'
        end 
    end 

    post '/posts' do
        user = Helpers.current_user(session)
        if user.nil?
            redirect to '/login'
        elsif params[:post][:content].empty?
            redirect to '/posts/new'
        else
            user.posts.build({content: params[:post][:conent]})
            user.save
        end 
        redirect to '/posts'
    end 

    get '/posts/:id' do
        redirect to '/login' unless Helpers.is_logged_in?(session)

        @post = post.find(params[:id])
        
        erb :'/posts/show_post'
    end 

    get '/posts/:id/edit' do
        redirect to '/login' unless Helpers.is_logged_in?(session)

        @post = post.find(params[:id])
        if @post.user == Helpers.current_user(session)
            erb :'/posts/edit_post'
        else 
            redirect to '/login'
        end 
    end 

    patch '/posts/id' do
        @post = post.find(params[:id])
        
        if params[:post][:content].empty?
            redirect to "/posts/#{@post.id}/edit"
        end 
        @post.update(params[:post])
        @post.save 

        redirect to "posts/#{@post.id}"
    end 

    delete '/posts/:id/delete' do
        if Helpers.is_logged_in?(session)
            @post = post.find(params[:id])
            if @post.user == Helpers.current_user(session)
                @post = post/find_by_id(params[:id])
                @post.delete 
                redirect to '/posts'
            else 
                redirect to '/posts'
            end
        else 
            redirect to '/login'
        end
        
    end 






end 