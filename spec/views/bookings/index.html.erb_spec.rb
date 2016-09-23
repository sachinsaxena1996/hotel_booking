require 'rails_helper'

RSpec.describe "bookings/index", type: :view do
  before(:each) do
    assign(:bookings, [
      Booking.create!(
        :customer_id => 2,
        :room_id => 3,
        :status => "Status"
      ),
      Booking.create!(
        :customer_id => 2,
        :room_id => 3,
        :status => "Status"
      )
    ])
  end

  it "renders a list of bookings" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
