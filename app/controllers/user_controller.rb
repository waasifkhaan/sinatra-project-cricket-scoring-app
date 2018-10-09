require 'rack-flash'
class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect to "/games"
    else
      erb :'users/signup'
    end
  end


  post '/signup' do
    @user = User.new(name: params[:name], username: params[:username], email_address: params[:email_address], password: params[:password])
    if @user.valid?
      @user.save
      redirect to "/login"
    else
      flash[:errors] = @user.errors
        redirect to "/signup"
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
        flash[:message] = "Welcome #{@user.name} to the cricket scoring applicaiton!"
          redirect to "/games"
      else
        flash[:messages] = "User does not exist"
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
