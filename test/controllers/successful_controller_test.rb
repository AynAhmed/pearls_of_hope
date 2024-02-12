require "test_helper"

class SuccessfulControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get successful_index_url
    assert_response :success
  end
end
