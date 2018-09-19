class GamesController < ApplicationController

  get '/games' do
    erb :'games/index'
  end

  get '/games/new' do
    if logged_in?
      erb :'games/new'
    else
      redirect to '/login'
    end
  end

  post '/games' do
    "Hello World"
    binding.pry
  end

end
