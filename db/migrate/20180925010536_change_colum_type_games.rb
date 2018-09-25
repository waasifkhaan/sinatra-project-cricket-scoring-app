class ChangeColumTypeGames < ActiveRecord::Migration
  def change
    change_column :games, :hometeam, :integer
    change_column :games, :awayteam, :integer
    change_column :games, :toss, :integer
    change_column :games, :result, :integer
  end
end
