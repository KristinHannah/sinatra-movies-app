class MoviesController < ApplicationController 

    get '/movies' do 
        @all_movies = current_user.movies.all 
        erb :'/movies/index'
    end 

    get '/movies/new' do 
        if !logged_in?
            redirect '/login'
        else 
            erb :'/movies/new'
        end 
    end 

    post '/movies' do 
        @movie = Movie.create(params)
        redirect to "/movies/#{@recipe.id}"
    end 

    get '/movies/:id' do 
        @movie = Movie.find_by_id(params[:id])
        erb :'/movies/show'
    end 

    get '/movies/:id/edit' do 
        if !logged_in?
            redirect '/login'
        else 
           if movie = current_user.movies.find_by(params[:id])
             @movie = Movie.find_by_id(params[:id])
             erb :edit
           else 
            redirect '/movies'
           end 
        end 
    end 

    patch '/movies/:id' do 
        @movie = Movie.find_by_id(params[:id])
        @movie.title = params[:title]
        @movie.release_date = params[:release_date]
        @movie.genre = params[:genre]
        @movie.director = params[:director]
        @movie.date_watched = params[:date_watched]
        @movie.location_watched = params[:location_watched]
        @movie.rating = params[:rating]
        @movie.save
        redirect to "/movies/#{@recipe.id}""
    end 

    delete '/movies/:id' do 
        @movie = Movie.find_by_id(params[:id])
        @movie.delete
        redirect to '/movies'
    end 

end 