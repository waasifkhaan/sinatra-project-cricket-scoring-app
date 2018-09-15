class UsersController < ApplicationController

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    erb :'users/show'
  end

  get '/signup' do

      erb :'users/signup', locals: {message: "Please sign up before you sign in"}

  end

  post '/signup' do

    if params[:username]== ""|| params[:email_address]== "" || params[:password]== "" || params[:password] != params[:passwordmatch]
      redirect to "/signup"
    else
      @user = User.create(name: params[:name], username: params[:username], email_address: params[:email_address], password: params[:password])
      session[:user_id] = @user.id
      redirect to "/login"
    end
  end

  get '/login' do
    if !logged_in?
      erb :'users/login'
    else
      redirect to '/logout'
    end
  end

  post '/login' do

   @user = User.find_by(:username => params[:username])
   if @user.authenticate(params[:password])
      # binding.pry
     session[:user_id] = @user.id

     redirect to "/games"
   else
     redirect to '/signup'
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
