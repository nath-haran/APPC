class UsersController < ApplicationController

	#before_action :signed_in_user
	#def signed_in_user
     # redirect_to home_path,  if signed_in?
    #end
	def new
		if !signed_in?
      redirect_to home_path
      
    end
		
		@user=User.new
	end
	def edit
		@user=current_user
	end
	def create
		#if signed_in? 
		#	redirect_to home_path
		#else
			@user=User.new(user_params)
			if(@user.save)
				#render 'success'
				#UserMailer.welcome_email(@user).deliver
				redirect_to signin_path
			else
				#redirect_to signup_path
				render 'new'
			end
	#	end

	end
	def profile
		@current_user=current_user
		if(current_user.nil?)
			flash[:error]="Please login to continue"
			redirect_to signin_path
		end
	end
		
		
	
	private

	   def user_params
	      params.require(:user).permit(:name, :email, :password,
	                                   :password_confirmation,:age, :cgpa, :roll_number, :gender, :dp)
	  	end

end
