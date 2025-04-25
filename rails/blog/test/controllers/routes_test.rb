require "test_helper"

class RoutesTest < ActionDispatch::IntegrationTest
  def setup
    Current.session = nil
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get new session" do
    get new_session_url
    assert_response :success
  end

  test "should get new password" do
    get new_password_url
    assert_response :success
  end

  test "should get new user" do
    get new_user_url
    assert_response :success
  end

  test "should get posts index" do
    get posts_url
    assert_response :success
  end

  test "should get post" do
    post = posts(:one)
    get post_url(post)
    assert_response :success
  end
end
