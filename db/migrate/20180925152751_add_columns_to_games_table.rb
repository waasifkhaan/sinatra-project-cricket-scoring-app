class AddColumnsToGamesTable < ActiveRecord::Migration
  def change
    add_column :games,  :extra_1, :integer, :default => false
    add_column :games,  :total_1, :integer, :default => false
    add_column :games,  :extra_2, :integer, :default => false
    add_column :games,  :total_2, :integer, :default => false
  end
end
