class PlayersController < ApplicationController

  get 'players/new' do
    erb :"players/new"
  end
end
