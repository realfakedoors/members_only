require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  
	def setup
		@user = users(:bojack)
	end

	test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: "", password: "" } }
    assert_nil session[:user_id]
	end

	test "login with valid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: @user.email, password: @user.password } }
    assert session[:user_id] = @user.id
  end

end
