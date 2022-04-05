class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :relationships, foreign_key: :following_id
  has_many :followings, through: :relationships, source: :follower

  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :reverse_of_relationships, source: :following

  has_many :photos, -> { order('created_at DESC') }, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :image
  validates :name, presence: true
  def is_followed_by?(user)
    reverse_of_relationships.find_by(following_id: user.id).present?
  end

  def liked_by?(photo_id)
    likes.where(photo_id: photo_id).exists?
  end
end
