class RemoveRateIdFromRoomTypes < ActiveRecord::Migration[5.1]
  def change
    remove_column :room_types, :rate_id, :integer
  end
end
