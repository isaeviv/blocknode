require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:tester)
  end

  test "nevalidnoe izmenenie" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: {name: "",
                                   email: "nevalidnyj@",
                                   password: "123",
                                   password_confirmation: "321"}
    assert_template 'users/edit'
  end

  test "uspeh!" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    name = "Test Test"
    email = "test@test.test"
    patch user_path(@user), user: { name: name, email: email, password: "",
                                  password_confirmation: ""}
    assert_not flash.empty?
    assert_redirected_to @users
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end

end
