class AdminController < ApplicationController

	def index
		
	end
	def home
		@companies= Companies.paginate(page: params[:page], :per_page   => 5)
	end
	def new
	end
	def send_reminder
		@companies=Companies.where("date= ? ", (Date.today+1).to_s)
	end
	def reminder
       @companies=Companies.where("date= ? ", (Date.today+1).to_s)
       #@users=User.all
       
       	@companies.each do |c|
       			@users = Studentlist.where("company_name=?", c.name)
       			@users.each do |u|
       				@user=User.find_by(roll_number: u.roll_number)
       			#puts "in the loop"
       			UserMailer.reminder(@user,c).deliver
       		end
       	end
       	redirect_to admin_home_path

    end
end
