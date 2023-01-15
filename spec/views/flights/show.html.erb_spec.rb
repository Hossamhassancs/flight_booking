require 'rails_helper'

RSpec.describe "flights/show", type: :view do
  before(:each) do
    assign(:flight, Flight.create!(
      aeroplan_type: "Aeroplan Type",
      origin: "Origin",
      destination: "Destination"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Aeroplan Type/)
    expect(rendered).to match(/Origin/)
    expect(rendered).to match(/Destination/)
  end
end
