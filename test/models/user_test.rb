require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup 
  	@user = User.new(name: "Thalia" , email: "thalia_brito@example.com")
  end
  
  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = "     "
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "     "
  	assert_not @user.valid?
  end

  test "name should not be too long" do
  	@user.name = "t"*51
  	assert_not @user.valid?
  end

  test "email should not be too long" do
  	@user.email = "t" *250+"@example.com"
  	assert_not @user.valid?
  end

  test "email validation should reject invalid addresses" do
  	invalid_addresses = %w[user@example,com hello_at.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
  	invalid_addresses.each do |invalid_address|
  		@user.email = invalid_address
  		assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
  	end
  end

  test "email address should be unique" do
  	duplicate_user = @user.dup 
  	duplicate_user.email = @user.email.upcase
  	@user.save
  	assert_not duplicate_user.valid?
  end
end
