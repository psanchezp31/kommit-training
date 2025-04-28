require "test_helper"

class CommentTest < ActiveSupport::TestCase
  def setup
    @user1 = users(:one)
    @user2 = users(:two)
    @post = posts(:one)
  end

  test "should be valid" do
    user1 = User.create!(username: "test_user1", email: "test1@example.com", password: "password123")
    user2 = User.create!(username: "test_user2", email: "test2@example.com", password: "password123")
    post = Post.create!(title: "Test Post", content: "Test Content", user: user1)

    Follow.create!(follower: user2, followed: user1)

    comment = Comment.new(content: "Great post!", user: user2, post: post)

    puts "\nDebug Information for valid test:"
    puts "User2 following User1? #{user2.following?(user1)}"
    puts "Comment valid? #{comment.valid?}"
    if !comment.valid?
      puts "Validation errors: #{comment.errors.full_messages}"
    end

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
    user1 = User.create!(username: "test_user1", email: "test1@example.com", password: "password123")
    user2 = User.create!(username: "test_user2", email: "test2@example.com", password: "password123")
    post = Post.create!(title: "Test Post", content: "Test Content", user: user1)

    comment = Comment.new(content: "Great post!", user: user2, post: post)

    puts "\nDebug Information for non-follower test:"
    puts "User2 following User1? #{user2.following?(user1)}"
    puts "Comment valid? #{comment.valid?}"
    if !comment.valid?
      puts "Validation errors: #{comment.errors.full_messages}"
    end

    assert_not comment.valid?
    assert_includes comment.errors[:base], "You must follow the post author to comment"
  end
end
