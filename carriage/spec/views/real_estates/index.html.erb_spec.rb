require 'rails_helper'
require 'will_paginate/array'

RSpec.describe "real_estates/index", type: :view do
  before(:each) do
    assign(:real_estates, [
      RealEstate.create!(),
      RealEstate.create!()
    ])
  end

#  it "renders a list of real_estates" do
#    render
#  end
end
