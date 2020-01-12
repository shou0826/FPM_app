class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.bigint :user_id
      t.string :user_name
      t.string :ps_id
      t.string :first_position
      t.string :second_position
      t.string :third_position
      t.string :attendance
      t.string :time_zone
      t.string :vc
      t.string :ligue
      t.text :text

      t.timestamps
    end
  end
end
