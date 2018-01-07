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

require 'rails_helper'

RSpec.describe RealEstate, type: :model do

  
    it "has a valid factory" do
      expect(FactoryBot.create(:real_estate)).to be_valid
    end
    
    it "is invalid without a street" do
      expect(FactoryBot.build(:real_estate, street: nil)).to_not be_valid
    end
    
    it "is invalid without a city" do
      expect(FactoryBot.build(:real_estate, city: nil)).to_not be_valid
    end
    it "is invalid without a category" do
      expect(FactoryBot.build(:real_estate, category: nil)).to_not be_valid
    end
    
    it "is invalid without a valid zip code (5 digits)" do
      expect{FactoryBot.create(:real_estate, zip: 999)}.to raise_error(ActiveRecord::RecordInvalid)
    end
    
  

end
