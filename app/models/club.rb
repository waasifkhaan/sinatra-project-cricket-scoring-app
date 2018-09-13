class Club < ActiveRecord::Base
  has_many :players
  has_many :teams
end
