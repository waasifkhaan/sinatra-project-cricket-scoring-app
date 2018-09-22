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
    @toss_won = Team.find_by(id: params[:toss])
    @result = Team.find_by(id: params[:result])
    @game = Game.new(hometeam: @team_1, awayteam: @team_2, toss: @toss_won, result: @result )

    erb :'/games/new1'
  end
  post '/games/teams/players' do
    @players_1 = params[:players_1].map do |id|
      Player.find(id)
    end
    @players_2 = params[:players_2].map do |id|
      Player.find(id)
    end
    erb :'/games/new2'
  end

  post '/games' do
      params[:players].each do |player|

        @player = Player.find_by(name: player[0])
        @runs = player[1]

      end
  end



end
