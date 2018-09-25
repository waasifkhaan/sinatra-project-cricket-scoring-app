class GamesController < ApplicationController

  get '/games' do
    erb :index
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

    # if params[:players_1].length == 0 || params[:players_2].length == 0
    #   redirect to "/games/teams"
    # else
    @players_1 = params[:players_1].map do |id|
      Player.find(id)
    end
    @players_2 = params[:players_2].map do |id|
      Player.find(id)
    end
    erb :'/games/new2'

  end

  post '/games' do
    # binding.pry

        @hometeam = Team.find(params[:hometeam]).name
        @awayteam = Team.find(params[:awayteam]).name
        @toss = Team.find(params[:toss]).name
        @result = Team.find(params[:result]).name

        @game = Game.new
        @game.hometeam = @hometeam
        @game.awayteam = @awayteam
        @game.toss = @toss
        @game.result = @result
        @game.save


      @scores = params[:players].map do |player|
        @player = Player.find_by(id: player[0])
        @score = Score.new(run: player[1])
        @score.player_id = @player.id
        @score.game_id = @game.id
        @score.save
        @score
      end

        erb :'games/index'

  end

end
