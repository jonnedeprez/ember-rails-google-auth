require 'test_helper'

class TokenControllerTest < ActionController::TestCase
  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get refresh" do
    get :refresh
    assert_response :success
  end

end
