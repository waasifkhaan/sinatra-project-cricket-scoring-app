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
    erb :'/games/new1'
  end
  post '/games/teams/players' do
    # binding.pry
    @players_1 = []
    i = 0
    while i < 11 do
      @players_1 << Player.find_by(id: params[:players_1][i]) if Player.find_by(id: params[:players_1][i]) != nil
      i = i + 1
    end
    @players_2 = []
    i = 0
    while i < 11 do
      @players_2 << Player.find_by(id: params[:players_2][i]) if Player.find_by(id: params[:players_2][i]) != nil
      i = i + 1
    end
    erb :'/games/new2'
  end
  # post '/games' do
  #   "Hello World"
  #
  # end



end
