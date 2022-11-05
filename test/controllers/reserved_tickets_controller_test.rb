require "test_helper"

class ReservedTicketsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reserved_tickets_index_url
    assert_response :success
  end
end
