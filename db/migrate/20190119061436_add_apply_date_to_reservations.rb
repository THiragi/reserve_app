class AddApplyDateToReservations < ActiveRecord::Migration[5.1]
  def change
    add_column :reservations, :apply_date, :date
  end
end
