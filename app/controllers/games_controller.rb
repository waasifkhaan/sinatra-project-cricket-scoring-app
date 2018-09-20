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
  post '/games/teams' do
    @team_1 = Team.find_by(id: params[:teams][0])
    @team_2 = Team.find_by(id: params[:teams][1])
    erb :'/games/player'
  end

  # post '/games' do
  #   "Hello World"
  #
  # end



end
