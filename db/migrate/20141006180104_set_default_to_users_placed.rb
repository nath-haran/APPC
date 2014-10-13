class SetDefaultToUsersPlaced < ActiveRecord::Migration
  def change

  	  change_column :users, :placed, :boolean, default: false
  

  end
end
