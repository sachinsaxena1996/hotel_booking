require 'rails_helper'

RSpec.describe "rooms/index", type: :view do
  before(:each) do
    assign(:rooms, [
      Room.create!(
        :number => "Number",
        :type => "Type",
        :specification => "Specification",
        :charges => 2.5,
        :status => "Status"
      ),
      Room.create!(
        :number => "Number",
        :type => "Type",
        :specification => "Specification",
        :charges => 2.5,
        :status => "Status"
      )
    ])
  end

  it "renders a list of rooms" do
    render
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Specification".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
