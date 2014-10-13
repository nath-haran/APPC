class AddPasswordToAdmin < ActiveRecord::Migration
  def change
    add_column :admins, :password, :string
    
  end
end
