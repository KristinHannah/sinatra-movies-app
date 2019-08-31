class MoviesController < ApplicationController 

    get '/movies' do 
        "You are logged in as #{session[:email]}"
    end 

    get '/movies/new' do 
        if !session[:email] 
            redirect '/login'
        else 
            'A new movie form'
        end 
    end 

    get '/movies/:id/edit' do 
        if !session[:email] 
            redirect '/login'
        else 
            'A edit movie form'
        end 
    end 

end 
