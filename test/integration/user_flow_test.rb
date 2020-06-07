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
    follow_redirect!
    assert_match "A message with a confirmation link has been sent to your email address.", @response.body
  end

  test "should sign in" do
    get new_user_session_path
    assert_select "input[type='email']"
    assert_select "input[type='password']"
    post user_session_path, params: { user: { email: @user.email, password: "password" } }
    assert_redirected_to root_path
    follow_redirect!
    assert_match "Signed in successfully.", @response.body
  end

  test "should update account" do
    sign_in @user
    get edit_user_registration_path
    assert_select "input[type='email']"
    assert_select "input[type='password']", 3
    put user_registration_path, params: { user: { password: "new_password", password_confirmation: "new_password", current_password: "password"  } }
    assert_redirected_to root_path
    follow_redirect!
    assert_match "Your account has been updated successfully", @response.body
  end

  test "should cancel account" do
    sign_in @user
    get edit_user_registration_path
    assert_select "input[type='submit']" do
      assert_select "[value=?]", "Cancel my account"
    end
    assert_difference("User.count", -1) do
      delete user_registration_path
    end
    assert_redirected_to root_path
    follow_redirect!
    assert_match "Your account has been successfully cancelled.", @response.body
  end

  test "should reset password" do
    get new_user_session_path
    assert_select "a[href='/users/password/new']"
    get new_user_password_path
    assert_select "input[type='email']"
    assert_select "input[value=?]", "Send me reset password instructions"
    assert_emails 1 do
      post user_password_path, params: { user: { email: @user.email  } }
    end
  end

  test "should have navigation for anonymous user" do
    get root_path
    assert_select "a[href=?]", new_user_session_path
    assert_select "a[href=?]", new_user_registration_path
  end

  test "should have navigation for authenticated user" do
    sign_in @user
    get root_path
    assert_select "a[href=?]", edit_user_registration_path
    assert_select "a[href=?]", destroy_user_session_path
  end
end
