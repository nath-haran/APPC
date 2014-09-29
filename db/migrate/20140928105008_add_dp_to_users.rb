class AddDpToUsers < ActiveRecord::Migration
  def change
  	 add_attachment :users, :dp
  end
end
