class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :customer_id
      t.integer :room_id
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
