require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = Post.new(
      title: "Test Post",
      content: "This is a test post content",
      user: @user
    )
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = nil
    assert_not @post.valid?
  end

  test "content should be present" do
    @post.content = nil
    assert_not @post.valid?
  end

  test "should belong to user" do
    @post.user = nil
    assert_not @post.valid?
  end
end
