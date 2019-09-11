class UsersController < ApplicationController

    get '/signup' do 
        erb :'/users/new', :layout => :layout1
    end 

    post '/users' do 
        @user = User.new 
        @user.email = params[:email]
        @user.password = params[:password]
        if @user.save
            redirect '/login'
        else 
            erb :'/users/new', :layout => :layout1
        end 
    end 


end 