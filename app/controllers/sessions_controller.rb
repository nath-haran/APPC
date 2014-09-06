class SessionsController < ApplicationController
  #before_action :signed_in_user
  #def self.signed_in_user
      
  #end
	def new
    if !signed_in?
      redirect_to home_path
      
    end
  end
  def destroy

    sign_out if !signed_in?
    redirect_to signin_path
  end
	def create
    user = User.find_by(roll_number: params[:session][:roll_number])
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to home_path
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      redirect_to(action: 'new')
    end
  end
end
