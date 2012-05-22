require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get new_paper" do
    get :new_paper
    assert_response :success
  end

end
