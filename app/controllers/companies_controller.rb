class CompaniesController < ApplicationController
	#before_action :signed_in_user
	def index
		signed_in_user
		@companies=Companies.all
        @date=Date.today
	end
	def signed_in_user
      redirect_to signin_path, notice: "Please sign in." if signed_in?
    end
    def create
    	@company=Companies.new(company_params)
    	if(@company.save)
    		redirect_to admin_home_path
    	else
    		flash[:error]="there is some error"
    		redirect_to admin_home_path
    	end
    end
    def company_agenda

        @c=Companies.find_by(name: params[:company])
    end
    private
    def company_params
    	params.require(:company).permit(:name, :cgpa,:date,:lastdate)
    end
    
end
