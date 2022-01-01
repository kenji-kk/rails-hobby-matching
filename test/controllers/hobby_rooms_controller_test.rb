require 'test_helper'

class HobbyRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hobby_rooms_index_url
    assert_response :success
  end

end
