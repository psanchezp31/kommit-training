class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content, presence: true
  validate :user_can_comment

  private

  def user_can_comment
    return if user.nil? || post.nil?

    unless user.following?(post.user)
      errors.add(:base, "You must follow the post author to comment")
    end
  end
end
