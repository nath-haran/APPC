class PrimaryChanges < ActiveRecord::Migration
  def change
  	execute "alter table admins drop constraint admins_pkey;"
  	execute "alter table users drop constraint users_pkey;"
  	execute "alter table admins drop column id"
  	execute "alter table users drop column id"
  	execute "alter table admins add primary key(username)"
  	execute "alter table users add primary key(roll_number)"
  	execute "alter table users drop column username"

  end
end
