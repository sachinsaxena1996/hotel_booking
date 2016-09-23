require 'rails_helper'

RSpec.describe "bookings/edit", type: :view do
  before(:each) do
    @booking = assign(:booking, Booking.create!(
      :customer_id => 1,
      :room_id => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit booking form" do
    render

    assert_select "form[action=?][method=?]", booking_path(@booking), "post" do

      assert_select "input#booking_customer_id[name=?]", "booking[customer_id]"

      assert_select "input#booking_room_id[name=?]", "booking[room_id]"

      assert_select "input#booking_status[name=?]", "booking[status]"
    end
  end
end
