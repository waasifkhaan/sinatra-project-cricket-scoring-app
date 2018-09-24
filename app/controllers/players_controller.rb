class PlayersController < ApplicationController

  get '/players/new' do
    erb :"players/new"
  end

  post '/players' do
    Player.create(name: params[:player_name], team_id: params[:team_name])
    redirect to '/games'

  end
end
