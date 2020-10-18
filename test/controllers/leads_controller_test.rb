require 'test_helper'

class LeadsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get leads_index_url
    assert_response :success
  end

end
