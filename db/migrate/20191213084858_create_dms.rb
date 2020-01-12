class CreateDms < ActiveRecord::Migration[5.2]
  def change
    create_table :dms do |t|
      t.integer :user1
      t.integer :user2

      t.timestamps
    end
  end
end
