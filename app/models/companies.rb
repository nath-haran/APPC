class Companies < ActiveRecord::Base
	validates :name, presence: true
	validates :date, presence: true
	validates :cgpa, presence: true
	has_many :studentlists
end
