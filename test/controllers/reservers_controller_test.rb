require "test_helper"

class ReserversControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reservers_index_url
    assert_response :success
  end
end
