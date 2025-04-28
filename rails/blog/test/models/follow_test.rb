require "test_helper"

class FollowTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:one)
    @user2 = users(:two)
  end

  test "should be valid" do
    follow = Follow.new(follower: @user1, followed: @user2)
    assert follow.valid?
  end

  test "should require a follower" do
    follow = Follow.new(followed: @user2)
    assert_not follow.valid?
  end

  test "should require a followed user" do
    follow = Follow.new(follower: @user1)
    assert_not follow.valid?
  end

  test "should not allow self-following" do
    follow = Follow.new(follower: @user1, followed: @user1)
    assert_not follow.valid?
  end

  test "should not allow duplicate follows" do
    Follow.create!(follower: @user1, followed: @user2)
    follow = Follow.new(follower: @user1, followed: @user2)
    assert_not follow.valid?
  end
end
