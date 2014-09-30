class Studentlist < ActiveRecord::Base
	belongs_to :companies
	belongs_to :users
	validates :roll_number, :uniqueness => {  :scope => :company_name }
end
