class AddIndexToBooking < ActiveRecord::Migration[5.0]
  def change
    add_index :bookings, :customer_id
    add_index :bookings, :room_type
    add_index :bookings, :room_id
  end
end
