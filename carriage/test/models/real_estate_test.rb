# == Schema Information
#
# Table name: real_estates
#
#  id         :integer          not null, primary key
#  street     :string
#  city       :string
#  zip        :integer
#  state      :string
#  beds       :integer
#  baths      :integer
#  sq_ft      :integer
#  category   :integer
#  sale_date  :date
#  price      :integer
#  lat        :float
#  lng        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class RealEstateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
