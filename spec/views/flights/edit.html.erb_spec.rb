require 'rails_helper'

RSpec.describe "flights/edit", type: :view do
  let(:flight) {
    Flight.create!(
      aeroplan_type: "MyString",
      origin: "MyString",
      destination: "MyString"
    )
  }

  before(:each) do
    assign(:flight, flight)
  end

  it "renders the edit flight form" do
    render

    assert_select "form[action=?][method=?]", flight_path(flight), "post" do

      assert_select "input[name=?]", "flight[aeroplan_type]"

      assert_select "input[name=?]", "flight[origin]"

      assert_select "input[name=?]", "flight[destination]"
    end
  end
end
