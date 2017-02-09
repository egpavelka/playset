require 'test_helper'

class UsersDestroyTest < ActionDispatch::IntegrationTest
  # test that an admin cannot delete himself
  # test that an admin can delete others
  # test that others cannot delete anyone

  def setup
    @admin = users(:testuser)
    @user = users(:otheruser)
  end

  test "non-logged in cannot delete" do
    assert_no_difference 'User.count' do
      delete user_path(@admin)
    end
    assert_redirected_to login_path
  end

  test "non-admin cannot delete" do
    log_in_as(@user)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end

  test "admin can delete" do
    log_in_as(@admin)
    assert_difference 'User.count', -1 do
      delete user_path(@user)
    end
  end

end
