class MoviesController < ApplicationController 

    get '/' do 
        @movies = Movie.all 
        erb :'/movies/all'
    end 

    get '/movies' do 
        @movies = current_user.movies.all 
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
        @movie.user_id = current_user.id
        @movie.save
        redirect to "/movies/#{@movie.id}"
    end 

    get '/movies/:id' do 
        @movie = Movie.find_by_id(params[:id])
        erb :'/movies/show'
    end 

    get '/movies/:id/edit' do 
        if !logged_in?
            redirect '/login'
        else 
           if current_user.movies.find_by_id(params[:id])
             @movie = Movie.find_by_id(params[:id])
             erb :'/movies/edit'
           else 
            redirect '/movies'
           end 
        end 
    end 

    patch '/movies/:id' do 
        @movie = Movie.find_by_id(params[:id])
        @movie.title = params[:title]
        @movie.director = params[:director]
        @movie.date_watched = params[:date_watched]
        @movie.location_watched = params[:location_watched]
        @movie.rating = params[:rating]
        @movie.review = params[:review]
        @movie.save
        redirect to "/movies/#{@movie.id}"
    end 

    delete '/movies/:id' do 
        if !logged_in? 
            redirect '/login'
        else 
            if current_user.movies.find_by(params[:id])
            @movie = Movie.find_by_id(params[:id])
             @movie.delete
            redirect to '/movies'
            else    
                redirect to '/movies'
            end
        end 
    end 

end 