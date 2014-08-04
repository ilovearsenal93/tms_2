class AddPasswordDigestToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :password_digest, :string
  end
end
