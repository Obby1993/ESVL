require "test_helper"

class GymnasesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get gymnases_new_url
    assert_response :success
  end

  test "should get create" do
    get gymnases_create_url
    assert_response :success
  end

  test "should get destroy" do
    get gymnases_destroy_url
    assert_response :success
  end
end
