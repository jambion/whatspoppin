require 'test_helper'

class PagesControllerTest < ActionController::TestCase

  test "should get browse" do
    get :browse
    assert_response :success
  end
  
  test "should get search" do
    get :search
    assert_response :success
  end
  
  test "should get about" do
    get :about
    assert_response :success
  end
end
