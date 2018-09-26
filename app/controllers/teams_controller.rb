class TeamsController < ApplicationController

  get '/teams/new' do
    erb :"teams/new"
  end

  post '/teams' do
    Team.create(name: params[:team_name], club_id: params[:club_name])
    redirect to '/games'

  end
end
