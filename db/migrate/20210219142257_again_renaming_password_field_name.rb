class AgainRenamingPasswordFieldName < ActiveRecord::Migration[6.0]
  def change
  	rename_column :signups, :password, :password_digest
  end
end
