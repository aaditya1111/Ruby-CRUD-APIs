class AddAuthoridToArrticles < ActiveRecord::Migration[6.0]
  def change
  	add_column :articles, :author_id, :string
  end
end
