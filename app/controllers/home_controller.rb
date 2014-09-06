class HomeController < ApplicationController
	before_action :signed_in_user

	def signed_in_user
      redirect_to signin_path, notice: "Please sign in." if signed_in?
    end
end
