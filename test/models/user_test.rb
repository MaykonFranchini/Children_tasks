require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "Should not create a user without name" do
    user = User.new
    assert_not user.save
  end
end
