require 'test_helper'

class UserFlowTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
  end

  test "should register" do
    get new_user_registration_path
    assert_select "input[type='email']"
    assert_select "input[type='password']", 2
    assert_difference("User.count", 1) do
      assert_emails 1 do
        post user_registration_path, params: { user: { email: "uniqe@example.com", password: "password", password_confirmation: "password" } }
      end
    end
    assert_redirected_to root_path
  end

  test "should sign in" do
    get new_user_session_path
    assert_select "input[type='email']"
    assert_select "input[type='password']"
    post user_session_path, params: { user: { email: @user.email, password: "password" } }
    assert_redirected_to root_path
  end

  test "should update account" do
    flunk
  end

  test "should cancel account" do
    flunk
  end

  test "should reset password" do
    flunk
  end

  test "should have navigation for anonymous user" do
    flunk
  end

  test "should have navigation for authenticated user" do
    flunk
  end
end
