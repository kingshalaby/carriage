require 'rails_helper'

RSpec.describe "real_estates/show", type: :view do
  before(:each) do
    @real_estate = assign(:real_estate, FactoryBot.create(:real_estate))
  end

  it "renders attributes in <p>" do
    render
  end
end
