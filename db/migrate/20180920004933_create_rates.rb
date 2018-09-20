class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.string :rate_type
      t.integer :amount
      t.integer :rank
      t.date :start_date
      t.date :end_date
      t.integer :weekday

      t.timestamps
    end
  end
end
