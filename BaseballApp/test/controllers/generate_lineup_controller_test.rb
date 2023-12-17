require "test_helper"

class GenerateLineupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get generate_lineup_index_url
    assert_response :success
  end
end
