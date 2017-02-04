require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example Name", email: "example@email.com", username: "example", password: "Password1", password_confirmation: "Password1")
  end

  test "validation" do
    assert @user.valid?
  end

  # FIELD REQUIRED

  test "name required" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "email required" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "username required" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "password required" do
    @user.password = @user.password_confirmation = " " * 7
    assert_not @user.valid?
  end

  # EMAIL LENGTH LIMIT

  test "email limit length" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end

  # REGEX ACCEPTANCE

  test "name accept validation" do
    valid_names = ['E.G. Pavelka', 'Kareem Abdul-Jabbar', 'Joe Schmoe', 'Darth Vader']
    valid_names.each do | valid_name |
      @user.name = valid_name
      assert @user.valid?, "#{valid_name.inspect} should be valid"
    end
  end

  test "email accept validation" do
    valid_addresses = %w[this@that.com USER@example.COM A-B_C@this.that.org this.that@there.net a@b.cd]
    valid_addresses.each do | valid_address |
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "username accept validation" do
    valid_usernames = %w[pachulia s8o.o8s _no_way_jose joe.seph77 steph._curry]
    valid_usernames.each do | valid_username |
      @user.username = valid_username
      assert @user.valid?, "#{valid_username.inspect} should be valid"
    end
  end

  # test "password accept validation" do
  #   valid_passwords = %w[joSeph1 !dArth_vadeR7 s8o.O8s _n0_Way_jose t?9Hab88]
  #   valid_passwords.each do | valid_password |
  #     @user.password = valid_password
  #     assert @user.valid?, "#{valid_password.inspect} should be valid"
  #   end
  # end

  # REGEX REJECTION

  test "name reject validation" do
    invalid_names = ['.E.G. Pavelka', 'Kareem Abdul_Jabbar', 'J0e Schm0e', 'Darth Vader-', ' Jar Jar', 'bob', 'a' * 52]
    invalid_names.each do | invalid_name |
      @user.name = invalid_name
      assert_not @user.valid?, "#{invalid_name.inspect} should be invalid"
    end
  end

  test "email reject validation" do
    invalid_addresses = %w[user@email,com user@emailcom USER@example. A-B_this.that.org this.that@there_then.net who@what+when.com]
    invalid_addresses.each do | address |
      @user.email = address
      assert_not @user.valid?, "#{address.inspect} should be invalid"
    end
  end

  test "username reject validation" do
    invalid_usernames = %w[kd james.michael.mcadoo_20 mc-adoo jo..seph joseph. joe77. no_way_jose! 673098]
    invalid_usernames.each do | invalid_username |
      @user.username = invalid_username
      assert_not @user.valid?, "#{invalid_username.inspect} should be invalid"
    end
  end

  # test "password reject validation" do
  #   invalid_passwords = %w[2335666  Norway br3nda password t9Ha]
  #   invalid_passwords.each do | invalid_password |
  #     @user.password = invalid_password
  #     assert_not @user.valid?, "#{invalid_password.inspect} should be invalid"
  #   end
  # end

  # REQUIRE UNIQUENESS

  test "email require unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "username require unique" do
    duplicate_user = @user.dup
    duplicate_user.username = @user.username.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

end
