require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(email: "unique@example.com", password: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  test "should not be confirmed" do
    assert_not @user.confirmed?
  end
 
  test "should have a unique email address" do
    @user.confirmed_at = Time.zone.now
    @user.save
    @duplicate_user = User.new(email: @user.email, password: "password")
    assert_not @duplicate_user.valid?
  end
end
