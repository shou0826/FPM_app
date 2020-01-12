class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :passive_user
      t.integer :active_user

      t.timestamps
    end
  end
end
