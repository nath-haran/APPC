class StudentlistsController < ApplicationController
	def create
		@currentuser=current_user
		@company=Companies.find_by(name: params[:student_lists][:name])
		if(@currentuser.cgpa>=@company.cgpa)

		@st=Studentlist.new		
		@st.company_name=params[:student_lists][:name]
		@st.roll_number=@currentuser.roll_number
		@st.save!
		redirect_to companies_path
		else
			flash[:error]="you  dont have enought cgpa "
			redirect_to companies_path

		end

	end
end
