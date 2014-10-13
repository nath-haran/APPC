class SetDefaultToUsersPassed < ActiveRecord::Migration
  def change
  	  change_column :users, :placed, :boolean, default: true
  end
end
