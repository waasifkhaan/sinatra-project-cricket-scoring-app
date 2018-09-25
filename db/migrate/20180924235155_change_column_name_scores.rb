class ChangeColumnNameScores < ActiveRecord::Migration
  def change
    rename_column :scores, :runs, :run
  end
end
