require 'test_helper'

class IngredientInventoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ingredient_inventories_index_url
    assert_response :success
  end

  test "should get create" do
    get ingredient_inventories_create_url
    assert_response :success
  end

  test "should get update" do
    get ingredient_inventories_update_url
    assert_response :success
  end

  test "should get destroy" do
    get ingredient_inventories_destroy_url
    assert_response :success
  end

end
