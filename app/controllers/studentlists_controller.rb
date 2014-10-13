class StudentlistsController < ApplicationController
	def create
		@currentuser=current_user
		@st=Studentlist.new		
		@st.company_name=params[:student_lists][:name]
		@st.roll_number=@currentuser.roll_number
		
		@company=Companies.find_by(name: params[:student_lists][:name])
		if @currentuser.placed
			flash[:error]="you  have already been placed...you cant register "
			redirect_to companies_path
			
		
		elsif(@currentuser.cgpa<
			@company.cgpa)
			flash[:error]="you  dont have enought cgpa "
			redirect_to companies_path
		elsif (!Studentlist.find_by(roll_number: @st.roll_number,company_name: @st.company_name).nil?)
			flash[:error]="you  have already registered "
			redirect_to companies_path	
		
		elsif(@st.save)
			flash[:success]="you have successfully registered"
			redirect_to companies_path
		else
			flash.now[:error]="There is some error please try again later"
			redirect_to companies_path			
		end

		end

	
end
