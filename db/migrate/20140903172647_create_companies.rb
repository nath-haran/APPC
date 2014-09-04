class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.date :date
      t.float :cgpa

      t.timestamps
    end
  end
end
