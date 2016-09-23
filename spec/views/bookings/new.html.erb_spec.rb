require 'rails_helper'

RSpec.describe "bookings/new", type: :view do
  before(:each) do
    assign(:booking, Booking.new(
      :customer_id => 1,
      :room_id => 1,
      :status => "MyString"
    ))
  end

  it "renders new booking form" do
    render

    assert_select "form[action=?][method=?]", bookings_path, "post" do

      assert_select "input#booking_customer_id[name=?]", "booking[customer_id]"

      assert_select "input#booking_room_id[name=?]", "booking[room_id]"

      assert_select "input#booking_status[name=?]", "booking[status]"
    end
  end
end
