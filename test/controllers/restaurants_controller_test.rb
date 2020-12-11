require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get restaurants_dashboard_url
    assert_response :success
  end

end
