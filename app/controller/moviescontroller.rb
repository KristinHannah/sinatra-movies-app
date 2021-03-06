class MoviesController < ApplicationController 

    get '/movies/all' do 
        @movies = Movie.all 
        erb :'/movies/all', :layout => :layout1
    end 

    get '/movies' do 
        if !logged_in?
            redirect '/login'
        else 
        @movies = current_user.movies.all 
        erb :'/movies/index', :layout => :layout1
        end 
    end 

    get '/movies/new' do 
        if !logged_in?
            redirect '/login'
        else 
            erb :'/movies/new', :layout => :layout1
        end 
    end 

    post '/movies' do 
        @movie = Movie.create(params)
        @movie.user_id = current_user.id
        if @movie.save
            redirect to "/movies/#{@movie.id}"
        else   
            erb :'/movies/new', :layout => :layout1
        end 
    end 

    get '/movies/:id' do 
        @movie = current_user.movies.find(params[:id])
        erb :'/movies/show', :layout => :layout1
    end 

    get '/movies/:id/edit' do 
        if !logged_in?
            redirect '/login'
        else 
           if current_user.movies.find(params[:id])
             @movie = current_user.movies.find(params[:id])
             erb :'/movies/edit', :layout => :layout1
           else 
            redirect '/movies'
           end 
        end 
    end 

    patch '/movies/:id' do 
        @movie = current_user.movies.find(params[:id])
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
            if current_user.movies.find(params[:id])
                @movie = current_user.movies.find(params[:id])
                @movie.delete
                redirect to '/movies'
            else    
                redirect to '/movies'
            end
        end 
    end 

end 