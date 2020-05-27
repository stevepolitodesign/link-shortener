require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do
    get root_path
    assert false
    assert_response :success
  end
end
