class MoviesController < ApplicationController 

    get '/movies' do 
        "You are logged in as #{session[:email]}"
    end 

    get '/movies/new' do 
        if !logged_in?
            redirect '/login'
        else 
            'A new movie form'
        end 
    end 

    get '/movies/:id/edit' do 
        if !logged_in?
            redirect '/login'
        else 
           if movie = current_user.movies.find_by(params[:id])
             #edit post form 
           else 
            redirect '/movies'
           end 
        end 
    end 

end 
