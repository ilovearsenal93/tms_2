class AddPasswordDigestToTrainees < ActiveRecord::Migration
  def change
    add_column :trainees, :password_digest, :string
  end
end
