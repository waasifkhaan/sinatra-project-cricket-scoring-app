class GamesController < ApplicationController

get '/games' do
  if logged_in?
    erb :"games/index"
  else
    redirect to "/login"
  end
end

get '/teamselection' do
  if logged_in?
    erb :'games/teamselection'
  else
    redirect to '/login'
  end
end

post '/teamselection/players' do
  if logged_in?
    @team_1 = Team.find(params[:hometeam])
    @team_2 = Team.find(params[:awayteam])
    erb :'/games/playerselection'
  else
    redirect to '/login'
  end
end
post '/games/new' do
  if logged_in?
    @two_teams = []
    @two_teams << params[:team_1]
    @two_teams << params[:team_2]
    @players_1 = params[:players_1].map do |id|
      Player.find(id)
    end
    @players_2 = params[:players_2].map do |id|
      Player.find(id)
    end
    erb :'/games/new'
  else
    redirect to '/login'
  end
end

post '/games' do
  if logged_in?
    @game = Game.new(hometeam: params[:hometeam], awayteam: params[:awayteam],
    toss: params[:toss], result: params[:result] , extra_1: params[:extras_1], extra_2: params[:extras_2], total_1: params[:total_1],
    total_2: params[:total_2] )
    @game.user_id = current_user.id
    current_user.games << @game
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
    if @game.save
      erb :'games/show'
    else
      redirect to "/teamselection"
    end
  else
    redirect to "/login"
  end
end

get '/games/:id' do
  if logged_in?
  @game = Game.find(params[:id])
  @scores_1 = []
  @scores_2 = []
  arr = @game.scores
  arr.each do |score|
    if Team.find(Player.find(score.player_id).team_id).name == @game.hometeam
      @scores_1 << score
    else
      @scores_2 << score
    end
  end
  erb :"games/show"
  else
    redirect to "/login"
  end
end

get '/games/:id/edit' do
  if logged_in?
    @game = Game.find(params[:id])
    @scores_1 = []
    @scores_2 = []
    scores = @game.scores
    scores.each do |score|
      if Team.find(Player.find(score.player_id).team_id).name == @game.hometeam
        @scores_1 << score
      else
        @scores_2 << score
      end
    end
    if @game && @game.user == current_user
      erb :"games/edit"
    else
      #add flash message
      redirect to '/games'
    end
  else
    redirect to '/login'
   end
 end
post "/games/:id" do
   if logged_in?
    @game = Game.find(params[:id])
      @game.update(hometeam: params[:hometeam], awayteam: params[:awayteam],
      toss: params[:toss], result: params[:result] , extra_1: params[:extras_1], extra_2: params[:extras_2], total_1: params[:total_1],
      total_2: params[:total_2] )
      @scores_1 = params[:players_1].map do |player|
        @score1 =  Score.where(game_id: params[:id], player_id: player[0])
        @score1[0].update(game_id: params[:id], player_id: player[0], run: player[1])
        @score1[0]
      end
      @scores_2 = params[:players_2].map do |player|
        @score2 =  Score.where(game_id: params[:id], player_id: player[0])
        @score2[0].update(game_id: params[:id], player_id: player[0], run: player[1])
        @score2[0]
    end
    erb :"games/show"
  else
  redirect to "/login"
  end
end

delete '/games/:id/delete' do
  if logged_in?
  @game = Game.find(params[:id])
    if @game && @game.user == current_user
      @game.delete
    else
      #flash message user does not have authority to delete game
      redirect to '/games'
    end
  else
    redirect to '/login'
  end
end
end
