class DropTableRuns < ActiveRecord::Migration
  def change
    drop_table :runs
  end
end
