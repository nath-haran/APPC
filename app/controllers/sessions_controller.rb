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
    redirect_to root_path
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

    # admin session pages
  def admin_new
    if !admin_signed_in?
      redirect_to admin_home_path
      
    end
  end
  def admin_destroy

    admin_sign_out if !admin_signed_in?
    redirect_to admin_signin_path
  end
  def admin_create
    admin = Admin.find_by(username: params[:session][:username])
    if admin && admin.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      admin_sign_in admin
      redirect_to admin_home_path
    else
      flash[:error] = 'Invalid email/password combination' # Not quite right!
      redirect_to(action: 'new')
    end
  end


end
