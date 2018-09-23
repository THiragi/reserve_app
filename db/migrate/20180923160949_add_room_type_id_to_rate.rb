class AddRoomTypeIdToRate < ActiveRecord::Migration[5.1]
  def change
    add_column :rates, :room_type_id, :integer
  end
end
