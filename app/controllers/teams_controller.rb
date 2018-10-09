require 'rack-flash'
class TeamsController < ApplicationController
  use Rack::Flash

  get '/teams/new' do
    erb :"teams/new"
  end

  post '/teams' do
    @team = Team.create(name: params[:team_name], club_id: params[:club_name])
    flash[:message] = "#{@team.name} saved"
    @teams = Team.all
    erb :"teams/index"
    end
end
