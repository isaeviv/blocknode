require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalidnye dannye dlja registracii" do
    get signup_path
    assert_no_difference 'User.count' do
      post users_path, user: { name: "",
                               email: "user@invalid",
                               password: "ras",
                               password_confirmation: "dva"}
    end
    assert_template 'users/new'
  end

  test "validnye dannye dlja registracii" do
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { name:  "Imja Familija",
                                            email: "imja@example.com",
                                            password:              "password",
                                            password_confirmation: "password" }
    end
    assert_template 'users/show'
    assert is_logged_in?
    
  end
end
