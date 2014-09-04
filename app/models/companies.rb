class Companies < ActiveRecord::Base
	validates :name, presence: true
	validates :date, presence: true
	validates :cgpa, presence: true
end
