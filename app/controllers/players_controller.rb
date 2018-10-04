require 'rack-flash'
class PlayersController < ApplicationController
  use Rack::Flash
  get '/players/new' do
    erb :"players/new"
  end

  post '/players' do
    @player = Player.create(name: params[:player_name], team_id: params[:team_name])

    erb :"players/index"

  end
end
