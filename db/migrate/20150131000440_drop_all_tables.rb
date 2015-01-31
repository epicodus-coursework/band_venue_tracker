class DropAllTables < ActiveRecord::Migration
  def change
    drop_table(:bands)
    drop_table(:venues)
    drop_table(:bands_venues)
  end
end
