require 'rails_helper'

RSpec.describe "rooms/new", type: :view do
  before(:each) do
    assign(:room, Room.new(
      :number => "MyString",
      :type => "",
      :specification => "MyString",
      :charges => 1.5,
      :status => "MyString"
    ))
  end

  it "renders new room form" do
    render

    assert_select "form[action=?][method=?]", rooms_path, "post" do

      assert_select "input#room_number[name=?]", "room[number]"

      assert_select "input#room_type[name=?]", "room[type]"

      assert_select "input#room_specification[name=?]", "room[specification]"

      assert_select "input#room_charges[name=?]", "room[charges]"

      assert_select "input#room_status[name=?]", "room[status]"
    end
  end
end
