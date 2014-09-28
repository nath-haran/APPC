class Studentlist < ActiveRecord::Base
	belongs_to :companies
	belongs_to :users
end
