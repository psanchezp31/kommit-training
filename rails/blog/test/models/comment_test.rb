require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:one)
    @user2 = users(:two)
    @post = posts(:one)
  end

  test "should be valid" do
    comment = Comment.new(content: "Great post!", user: @user1, post: @post)
    assert comment.valid?
  end

  test "should require content" do
    comment = Comment.new(user: @user1, post: @post)
    assert_not comment.valid?
  end

  test "should require a user" do
    comment = Comment.new(content: "Great post!", post: @post)
    assert_not comment.valid?
  end

  test "should require a post" do
    comment = Comment.new(content: "Great post!", user: @user1)
    assert_not comment.valid?
  end

  test "should not allow comments from non-followers" do
    comment = Comment.new(content: "Great post!", user: @user2, post: @post)
    assert_not comment.valid?
  end
end
