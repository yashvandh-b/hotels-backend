require "test_helper"

class HotelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hotel = hotels(:one)
  end

  test "should get index" do
    get hotels_url
    assert_redirected_to home_index_url
  end

  test "should get new" do
    get new_hotel_url
    assert_redirected_to root_url
  end

  test "should create hotel" do
    assert_difference('Hotel.count') do
      post hotels_url, params: { hotel: { name: @hotel.name, phone: @hotel.phone, email: @hotel.email } }
    end
    assert_redirected_to root_url
  end

  test "should show hotel" do
    get hotel_url(@hotel)
    assert_redirected_to home_index_url
  end

  test "should get edit" do
    get edit_hotel_url(@hotel)
    assert_redirected_to root_url
  end

  test "should update hotel" do
    patch hotel_url(@hotel), params: { hotel: { name: @hotel.name, phone: @hotel.phone, email: @hotel.email } }
    assert_redirected_to root_url
  end

  test "should destroy hotel" do
    assert_difference('Hotel.count', -1) do
      delete hotel_url(@hotel)
    end

    assert_redirected_to hotels_url
  end
end
