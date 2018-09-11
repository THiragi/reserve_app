class CreateReservations < ActiveRecord::Migration[5.1]
  def change
    create_table :reservations do |t|
      t.string :reserve_no
      t.string :guest_name
      t.string :guest_phone
      t.string :guest_mail
      t.date :check_in_date
      t.date :check_out_date
      t.integer :room_id
      t.integer :guest_count
      t.string :stay_note

      t.timestamps
    end
  end
end
