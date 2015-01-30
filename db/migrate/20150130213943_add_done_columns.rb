class AddDoneColumns < ActiveRecord::Migration
  def change
    add_column(:bands, :done, :boolean)
    add_column(:venues, :done, :boolean)
  end
end
