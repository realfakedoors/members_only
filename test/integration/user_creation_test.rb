require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "valid user information" do
  	assert_difference 'User.count', 1 do
  		User.create(
  			name: 								 "Boss Hogg",
  			email: 								 "bosshogg@hazzard.tn",
  			password: 						 "foobar",
  			password_confirmation: "foobar"
  			)
  	end
  end

  test "invalid user information" do
  	assert_no_difference 'User.count' do
  		User.create(
  			name: 								 "",
  			email: 								 "fake@guy",
  			password: 						 "foobar",
  			password_confirmation: "barfoo"
  			)
  	end
  end

end
