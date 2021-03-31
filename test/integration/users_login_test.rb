require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

  test "chtoby flash ne pojavljalsja lishnij raz" do
    get login_path
    assert_template 'sessions/new'
    post login_path, session: { email: "", password: "" }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get home_path
    assert flash.empty?
  end

end
