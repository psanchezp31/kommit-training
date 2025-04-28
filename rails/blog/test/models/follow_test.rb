require "test_helper"

class FollowTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:one)
    @user2 = users(:two)
  end

  test "should be valid" do
    user1 = User.create!(username: "test_user1", email: "test1@example.com", password: "password123")
    user2 = User.create!(username: "test_user2", email: "test2@example.com", password: "password123")

    follow = Follow.new(follower: user1, followed: user2)

    if !follow.valid?
      puts "Validation errors: #{follow.errors.full_messages}"
    end

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
    follow2 = Follow.new(follower: @user1, followed: @user2)
    assert_not follow2.valid?
    assert_includes follow2.errors[:followed_id], "You are already following this user"
  end
end
