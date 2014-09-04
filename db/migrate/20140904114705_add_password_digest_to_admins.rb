class AddPasswordDigestToAdmins < ActiveRecord::Migration
  def change
    add_column :admins, :password_digest, :string
    execute "alter table admins drop column password"
  end
end
