class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :password
      t.string :email
      t.integer :age
      t.float :cgpa
      t.integer :roll_number
      t.string :gender

      t.timestamps
    end
  end
end
