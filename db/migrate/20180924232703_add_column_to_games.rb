class AddColumnToGames < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.column :user_id, :integer, default: false
    end
  end
end
