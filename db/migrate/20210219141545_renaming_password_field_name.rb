class RenamingPasswordFieldName < ActiveRecord::Migration[6.0]
  def change
  	rename_column :signups, :password_digest, :password
  end
end
