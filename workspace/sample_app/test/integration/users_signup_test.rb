require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do 
    get signup_path
    assert_no_difference 'User.count'  do
      post users_path, params: { user: { name: "Juan Armando Montoya Montoya", 
                                          email: "jamontoya2@hotmail.com",
                                          password:             "jamm4519",
                                          password_confirmation:"jamm4519"}}
    end
    assert_template 'users/new'  
  end
end
