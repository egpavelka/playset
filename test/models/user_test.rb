require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example Name", email: "example@email.com")
  end

  test "validation" do
    assert @user.valid?
  end

  test "name required" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email required" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "name limit length" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "email limit length" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  test "email accept validation" do
    valid_addresses = %w[user@email.com USER@example.COM A-B_C@this.that.org this.that@there.net]
    valid_addresses.each do | address |
      @user.email = address
      assert @user.valid?, "#{address.inspect} should be valid"
    end
  end

  test "email reject validation" do
    invalid_addresses = %w[user@email,com user@emailcom USER@example. A-B_this.that.org this.that@there_then.net who@what+when.com]
    invalid_addresses.each do | address |
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid"
    end
  end

  test "email require unique" do
    duplicate = @user.dup
    duplicate.email = @user.email.upcase
    @user.save
    assert_not duplicate.valid?
  end

end
