class User < ApplicationRecord
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  has_many :posts
  has_many :sessions, dependent: :destroy
  has_many :follower_relationships, class_name: "Follow", foreign_key: "followed_id"
  has_many :followed_relationships, class_name: "Follow", foreign_key: "follower_id"
  has_many :followers, through: :follower_relationships, source: :follower
  has_many :following, through: :followed_relationships, source: :followed
  has_many :comments, dependent: :destroy
end
