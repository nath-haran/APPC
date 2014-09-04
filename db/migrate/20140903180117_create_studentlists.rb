class CreateStudentlists < ActiveRecord::Migration
  def change
    create_table :studentlists do |t|
      t.string :company_name
      t.string :roll_number
      t.string :name

      t.timestamps
    end
  end
end
