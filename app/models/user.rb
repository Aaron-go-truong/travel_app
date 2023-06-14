class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable
  has_one_attached :avatar

  has_many :active_relationships, class_name: 'Relationship',
                                  foreign_key: 'follower_id',
                                  dependent: :destroy
  has_many :passive_relationships, class_name: 'Relationship',
                                   foreign_key: 'followed_id',
                                   dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  has_many :plans, dependent: :destroy

  # Follows a user.
  def follow(other_user)
    unless following?(other_user)
      active_relationships.create(followed_id: other_user.id)
    end
  end

  # Unfollows a user.
  def unfollow(other_user)
    if following?(other_user)
      active_relationships.find_by(followed_id: other_user.id).destroy
    end
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
