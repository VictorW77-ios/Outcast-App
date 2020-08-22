class PostsController < ApplicationController

    # implements C.R.U.D by: 


    # READING : model gets all posts from db
    get '/posts' do
        @posts = Post.all 
        erb :'/posts/index'
    end 

    # CREATING : allows user to make a new post
    get '/posts/new' do
        if logged_in?
            erb :'posts/new'
        else 
            # error message
            redirect '/'
        end 
    end 

    post '/posts' do
        post = Post.new(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
        
        if post.save # varifies is input is legit, .save triggers validation
            #need success message 
            redirect "/posts/#{post.id}"
        else 
            # need error message
            redirect "/posts/new"
        end 
    end 

    # route for individual post
    get '/posts/:id' do
        @post = Post.find(params[:id])
        
        erb :'/posts/show'
    end 


    # UPDATING : user can edit their post but no one else's
    get '/posts/:id/edit' do
        @post = post.find(params[:id])

        if authorized_to_edit?(@post)
            erb :'/posts/edit'
        else 
            # insert error message!!
            redirect to '/posts'
        end 
    end 

    patch '/posts/id' do
        @post = Post.find(params[:id])

        @post.update(title: params[:title], iamge_url: params[:image_url], description: params[:description])

        redirect to "/posts/#{@post.id}"
    end 

    # delete '/posts/:id/delete' do
    #     @post = Post.find(params[:id])
    #     @post.user =
    #             @post = post/find_by_id(params[:id])
    #             @post.delete 
    #             redirect to '/posts'
    #         else 
    #             redirect to '/posts'
    #         end
    #     else 
    #         redirect to '/login'
    #     end
        
    # end 






end 