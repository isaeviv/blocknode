require 'test_helper'

class UsersControllerTest < ActionController::TestCase

  def setup
    @user = users(:tester)
    @vtoroj_user = users(:vtoroj)
  end

  test "dolzhen perenapravljat' redaktirovanie, kogda vy ne voshli v sistemu" do
    get :edit, id: @user
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "dolzhen perenapravljat' obnovlenie, kogda vy ne voshli v sistemu" do
    patch :update, id: @user, user: {name: @user.name, email: @user.email}
    assert_not flash.empty?
    assert_redirected_to login_url
  end



  test "dolzhen ne puskat' k redaktirovaniju drugogo usera" do
    log_in_as(@vtoroj_user)
    get :edit, id: @user
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "dolzhen ne puskat' k obnovleniju drugogo usera" do
    log_in_as(@vtoroj_user)
    patch :update, id: @user, user: { name: @user.name, email: @user.email }
    assert flash.empty?
    assert_redirected_to root_url
  end

end
