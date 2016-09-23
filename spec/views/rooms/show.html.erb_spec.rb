require 'rails_helper'

RSpec.describe "rooms/show", type: :view do
  before(:each) do
    @room = assign(:room, Room.create!(
      :number => "Number",
      :type => "Type",
      :specification => "Specification",
      :charges => 2.5,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Specification/)
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/Status/)
  end
end
