class GamesController < ApplicationController

  get '/games' do
    erb :index
  end

  get '/teamselection' do
    if logged_in?
      erb :'games/teamselection'
    else
      redirect to '/login'
    end
  end

  post '/teamselection/players' do

    @team_1 = Team.find_by(id: params[:teams][0])
    @team_2 = Team.find_by(id: params[:teams][1])
    erb :'/games/playerselection'
  end
  post '/games/new' do

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
    erb :'/games/new'

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

      @game = Game.find(params[:id])
      @scores_1 = []
      @scores_2 = []

      arr = Score.where(game_id: params[:id])

      # if player. team name is @game.hometeam then add the corresponding score to @scores_1
      arr.each do |score|
      if Team.find(Player.find(score.player_id).team_id).name == @game.hometeam
        @scores_1 << score
      else
        @scores_2 << score
      end
    end

    erb :"games/show"
  end

  get '/games/:id/edit' do

      @game = Game.find(params[:id])
      @scores_1 = []
      @scores_2 = []

      arr = Score.where(game_id: params[:id])

      # if player. team name is @game.hometeam then add the corresponding score to @scores_1
      arr.each do |score|
      if Team.find(Player.find(score.player_id).team_id).name == @game.hometeam
        @scores_1 << score
      else
        @scores_2 << score
      end
    end
      erb :"games/edit"
    end

  post "/games/:id" do
    binding.pry
    @game = Game.find(params[:id])
      @game.update(hometeam: params[:hometeam], awayteam: params[:awayteam],
      toss: params[:toss], result: params[:result] , extra_1: params[:extras_1], extra_2: params[:extras_2], total_1: params[:total_1],
      total_2: params[:total_2] )
      params[:players_1].each do |player|
        Player.find_by(id: player[0])
        @score = Score.new(run: player[1])
        @score.update
      end
      params[:players_2].each do |player|
        Player.find_by(id: player[0])
        @score1= Score.new(run: player[1])
        @score1.update
    end
  end
end
