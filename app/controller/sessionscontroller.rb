class SessionsController < ApplicationController 

    get '/login' do 
        erb :'sessions/login'
    end 

    post '/sessions' do 
       session[:email] = params[:email]
       redirect '/movies'
    end 

    get '/logout' do 
        session.clear 
        redirect '/movies'
    end 

end 