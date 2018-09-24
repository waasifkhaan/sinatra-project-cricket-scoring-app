class TeamsController < ApplicationController
  get 'teams/new' do
    binding.pry
    erb :"teams/new"
  end
end
