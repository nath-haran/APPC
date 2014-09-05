class AddConstraintsToStudentlist < ActiveRecord::Migration
  def change
  	execute "alter table studentlists alter column roll_number set data type integer using (roll_number::integer)"
  	execute "alter table companies drop constraint companies_pkey"
  	execute "alter table companies drop column id"
  	execute "alter table companies add primary key(name)"

  	execute "alter table studentlists add constraint company_name foreign key(company_name) references companies(name) "
  	execute "alter table studentlists add constraint stud_roll foreign key(roll_number) references users(roll_number) "
  	execute "alter table studentlists drop constraint studentlists_pkey"
  	execute "alter table studentlists drop column id"
  	execute "alter table studentlists add primary key(company_name,roll_number)"
  end
end
