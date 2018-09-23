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
        @game = Game.new(hometeam: Team.find_by(params[:hometeam]) , awayteam: Team.find_by(params[:awayteam]) , toss: Team.find_by(params[:toss]), result: Team.find_by(params[:result]))
        @game.save
      @scores = params[:players].map do |player|
        @player = Player.find_by(id: player[0])
        @score = Score.new(runs: player[1])
        @score.player_id = @player.id
        @score.game_id = @game.id
        @score.save



      end
        erb :'games/index'
          binding.pry
  end



end
