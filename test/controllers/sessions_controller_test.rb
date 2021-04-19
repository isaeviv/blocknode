require 'test_helper'

class SessionsControllerTest < ActionController::TestCase

  test "rugaetsja na imja should get new" do
    get :new
    assert_response :success
  end

end
