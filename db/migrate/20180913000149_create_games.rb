class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :hometeam
      t.string :awayteam
      t.string :toss
      t.string :result
    end
  end
end
