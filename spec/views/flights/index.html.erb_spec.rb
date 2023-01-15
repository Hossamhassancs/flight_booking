require 'rails_helper'

RSpec.describe "flights/index", type: :view do
  before(:each) do
    assign(:flights, [
      Flight.create!(
        aeroplan_type: "Aeroplan Type",
        origin: "Origin",
        destination: "Destination"
      ),
      Flight.create!(
        aeroplan_type: "Aeroplan Type",
        origin: "Origin",
        destination: "Destination"
      )
    ])
  end

  it "renders a list of flights" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Aeroplan Type".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Origin".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Destination".to_s), count: 2
  end
end
