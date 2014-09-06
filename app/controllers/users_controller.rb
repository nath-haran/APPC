class UsersController < ApplicationController

	#before_action :signed_in_user
	#def signed_in_user
     # redirect_to home_path,  if signed_in?
    #end
	def new
		
		@user=User.new
	end
	def create
		#if signed_in? 
		#	redirect_to home_path
		#else
			@user=User.new(user_params)
			if(@user.save)
				#render 'success'
				UserMailer.welcome_email(@user).deliver
				redirect_to signin_path
			else
				#redirect_to signup_path
				render 'new'
			end
	#	end

	end
	def show
	end
	private

	   def user_params
	      params.require(:user).permit(:name, :email, :password,
	                                   :password_confirmation,:age, :cgpa, :roll_number, :gender)
	  	end

end
