class AddDateAndDescriptionToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :lastdate, :date
    add_column :companies, :description, :text
  end
end
