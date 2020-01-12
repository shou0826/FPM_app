class AddTimeZoneToProfiles < ActiveRecord::Migration[5.2]
  def change
  	add_column :profiles, :time_zone_rear, :string
  end
end
