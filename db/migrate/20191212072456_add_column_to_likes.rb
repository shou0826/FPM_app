class AddColumnToLikes < ActiveRecord::Migration[5.2]
  def change
  	add_column :likes, :active_user_name, :string
  end
end
