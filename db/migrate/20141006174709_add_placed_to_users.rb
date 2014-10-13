class AddPlacedToUsers < ActiveRecord::Migration
  def change
    add_column :users, :placed, :boolean
  end
end
