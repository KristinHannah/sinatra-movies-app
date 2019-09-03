class SessionsController < ApplicationController 

    get '/login' do 
        erb :'sessions/login'
    end 

    post '/sessions' do 
       login(params[:email], params[:password])
       redirect '/movies'
    end 

    get '/logout' do 
        session.clear 
        redirect '/login'
    end 

end 