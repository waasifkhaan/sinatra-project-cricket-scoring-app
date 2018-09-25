class CreateScores < ActiveRecord::Migration
  def change
      create_table :scores do |t|
      t.integer :game_id
      t.integer :player_id
      t.integer :runs
    end
  end
end
