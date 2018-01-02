require 'test_helper'

class RealEstatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @real_estate = real_estates(:one)
  end

  test "should get index" do
    get real_estates_url
    assert_response :success
  end

  test "should get new" do
    get new_real_estate_url
    assert_response :success
  end

  test "should create real_estate" do
    assert_difference('RealEstate.count') do
      post real_estates_url, params: { real_estate: { baths: @real_estate.baths, beds: @real_estate.beds, city: @real_estate.city, lat: @real_estate.lat, long: @real_estate.long, price: @real_estate.price, sale_date: @real_estate.sale_date, sq_ft: @real_estate.sq_ft, state: @real_estate.state, street: @real_estate.street, type: @real_estate.type, zip: @real_estate.zip } }
    end

    assert_redirected_to real_estate_url(RealEstate.last)
  end

  test "should show real_estate" do
    get real_estate_url(@real_estate)
    assert_response :success
  end

  test "should get edit" do
    get edit_real_estate_url(@real_estate)
    assert_response :success
  end

  test "should update real_estate" do
    patch real_estate_url(@real_estate), params: { real_estate: { baths: @real_estate.baths, beds: @real_estate.beds, city: @real_estate.city, lat: @real_estate.lat, long: @real_estate.long, price: @real_estate.price, sale_date: @real_estate.sale_date, sq_ft: @real_estate.sq_ft, state: @real_estate.state, street: @real_estate.street, type: @real_estate.type, zip: @real_estate.zip } }
    assert_redirected_to real_estate_url(@real_estate)
  end

  test "should destroy real_estate" do
    assert_difference('RealEstate.count', -1) do
      delete real_estate_url(@real_estate)
    end

    assert_redirected_to real_estates_url
  end
end
