class ApplicationController < Sinatra::Base 

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        set :show_exceptions, :after_handler
        enable :sessions 
        set :session_secret, 'moviescollection'
    end 

    not_found do 
        erb :'/error', :layout => :layout1
    end 

    error 400..501 do 
        erb :'/error', :layout => :layout1
    end 

    get '/' do 
        erb :'/entry'
    end

    get '/LICENSE' do 
        erb :'/license', :layout => :layout1
    end 

    helpers do 

        def logged_in?
            !!current_user
        end 
        
        def current_user 
            @current_user ||= User.find_by(:email => session[:email]) if session[:email]
        end 

        def login(email, password)
           user = User.find_by(:email => email) 
            if user && user.authenticate(password)
            session[:email] = user.email 
           else 
            redirect '/login'
           end 
        end 

        def logout! 
            session.clear 
        end 
    end 
        
end 