require "test_helper"

class EntrainementsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get entrainements_new_url
    assert_response :success
  end

  test "should get create" do
    get entrainements_create_url
    assert_response :success
  end

  test "should get destroy" do
    get entrainements_destroy_url
    assert_response :success
  end
end
