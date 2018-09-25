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

    @two_teams = []
    @two_teams << params[:team_1]
    @two_teams << params[:team_2]

    # binding.pry
    @players_1 = params[:players_1].map do |id|
      Player.find(id)
    end
    @players_2 = params[:players_2].map do |id|
      Player.find(id)
    end
    erb :'/games/new2'

  end

  post '/games' do

        @game = Game.create(hometeam: params[:hometeam], awayteam: params[:awayteam],
         toss: params[:toss], result: params[:result] , extra_1: params[:extras_1], extra_2: params[:extras_2], total_1: params[:total_1],
         total_2: params[:total_2] )

        @scores_1 = params[:players_1].map do |player|
        @player = Player.find_by(id: player[0])
        @score_1 = Score.new(run: player[1])
        @score_1.player_id = @player.id
        @score_1.game_id = @game.id
        @score_1.save
        @score_1

      end

      @scores_2 = params[:players_2].map do |player|
      @player = Player.find_by(id: player[0])
      @score_2 = Score.new(run: player[1])
      @score_2.player_id = @player.id
      @score_2.game_id = @game.id
      @score_2.save
      @score_2

    end

        erb :'games/show'

  end
    get '/games/:id' do

        "Hello world"
    end
end
