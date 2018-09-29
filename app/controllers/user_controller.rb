class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do
    if logged_in?
      redirect to "/games"
    else
      erb :'users/signup', locals: {message: "Please sign up before you sign in"}
    end
  end

  post '/signup' do
    if params[:username]== ""|| params[:email_address]== "" || params[:password]== "" || params[:password] != params[:passwordmatch]
      redirect to "/signup"
    else
      @user = User.create(name: params[:name], username: params[:username], email_address: params[:email_address], password: params[:password])
        erb :"users/show"
    end
  end

  get '/login' do
    if logged_in?
       redirect to "/games"
    else
      erb :"/users/login"
    end
  end

  post '/login' do
    if !logged_in?
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect to "/games"
        else
          redirect to "/login"
        end
    else
     redirect to '/games'
    end
  end

  get '/logout' do
    if logged_in?
      session.clear
      redirect to "/login"
    else
      redirect to '/'
    end
  end

end
