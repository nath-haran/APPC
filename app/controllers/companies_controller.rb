class CompaniesController < ApplicationController
	before_action :signed_in_user
	def index
		@companies=Companies.all

	end
	def signed_in_user
      redirect_to signin_path, notice: "Please sign in." if signed_in?
    end
end
