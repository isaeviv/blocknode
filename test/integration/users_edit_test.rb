require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:Zhmyh)
  end

  test "nevalidnoe izmenenie" do
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: {name: "",
                                   email: "nevalidnyj@",
                                   password: "123",
                                   password_confirmation: "321"}
    assert_template 'users/edit'
  end

end
