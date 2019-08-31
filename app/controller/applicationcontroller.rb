class ApplicationController < Sinatra::Base 

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions 
        set :session_secret, 'moviescollection'
    end 

    get '/' do 
        session[:greeting] = "Hello"
        "Hello World!"
    end 
    

    helpers do 

        def logged_in?
            !!session[:email]
        end 
        
    end 
        
end 