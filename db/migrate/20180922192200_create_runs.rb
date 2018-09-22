class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.integer :game_run
      t.integer :score_id
    end
  end
end
