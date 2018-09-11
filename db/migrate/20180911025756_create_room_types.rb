class CreateRoomTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :room_types do |t|
      t.string :type_name
      t.integer :capacity
      t.integer :rate_id
      t.string :image
      t.string :room_note

      t.timestamps
    end
  end
end
