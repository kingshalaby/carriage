require 'rails_helper'

RSpec.describe "real_estates/new", type: :view do
  before(:each) do
    assign(:real_estate, RealEstate.new())
  end

  it "renders new real_estate form" do
    render

    assert_select "form[action=?][method=?]", real_estates_path, "post" do
    end
  end
end
