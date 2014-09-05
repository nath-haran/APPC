class AddNotNull < ActiveRecord::Migration
  def change
  	change_column :users, :password, :string, null:false
  	change_column :admins,:password, :string, null:false
  end
end
