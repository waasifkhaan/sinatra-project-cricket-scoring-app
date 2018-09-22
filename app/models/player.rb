class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :club
  has_many :runs
  has_many :games
  has_many :scores
end
