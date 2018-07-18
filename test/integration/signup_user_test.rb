require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = User.new(username: "john", email: "john@example.com", password: "password")   
    # post users_path, :user => { :email => 'john@example.com' }
  end
  
  test "sign up new user" do
    get signup_path
    assert_template 'users/_form'
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, 
          user: {username: @user.username, email: @user.email, password: @user.password }      
    end
    assert_template 'users/show'
    assert_match "john", response.body
  end
  
  
end