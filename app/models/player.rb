class Player < ActiveRecord::Base
  has_many :scores
  belongs_to :team
end
