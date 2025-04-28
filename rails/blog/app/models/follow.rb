class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true
  validate :not_following_self
  validates :followed_id, uniqueness: { scope: :follower_id, message: "You are already following this user" }

  private

  def not_following_self
    if follower_id == followed_id
      errors.add(:base, "You cannot follow yourself")
    end
  end
end
