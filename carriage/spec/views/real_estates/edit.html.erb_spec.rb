require 'rails_helper'

RSpec.describe "real_estates/edit", type: :view do
  before(:each) do
    @real_estate = assign(:real_estate, FactoryBot.create(:real_estate))
  end

  it "renders the edit real_estate form" do
    render

    assert_select "form[action=?][method=?]", real_estate_path(@real_estate), "post" do
    end
  end
end
