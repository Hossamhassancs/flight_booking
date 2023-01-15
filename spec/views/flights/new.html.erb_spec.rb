require 'rails_helper'

RSpec.describe "flights/new", type: :view do
  before(:each) do
    assign(:flight, Flight.new(
      aeroplan_type: "MyString",
      origin: "MyString",
      destination: "MyString"
    ))
  end

  it "renders new flight form" do
    render

    assert_select "form[action=?][method=?]", flights_path, "post" do

      assert_select "input[name=?]", "flight[aeroplan_type]"

      assert_select "input[name=?]", "flight[origin]"

      assert_select "input[name=?]", "flight[destination]"
    end
  end
end
