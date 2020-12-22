require 'test_helper'

class InventoryRefillsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get inventory_refills_create_url
    assert_response :success
  end

  test "should get index" do
    get inventory_refills_index_url
    assert_response :success
  end

end
