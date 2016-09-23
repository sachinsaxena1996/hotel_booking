class AddBookingNumberToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :booking_number, :string
  end
end
