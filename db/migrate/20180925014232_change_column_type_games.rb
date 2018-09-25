class ChangeColumnTypeGames < ActiveRecord::Migration
  def change
    change_column :games, :hometeam, :string
    change_column :games, :awayteam, :string
    change_column :games, :toss, :string
    change_column :games, :result, :string
  end
end
