class AddColumnMessages < ActiveRecord::Migration[5.2]
  def change
  	add_column :messages, :room_id, :bigint
  end
end
