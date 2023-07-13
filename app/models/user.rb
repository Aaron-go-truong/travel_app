# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  address                :string
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  date_of_birth          :datetime
#  deactivated            :boolean          default(FALSE), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  gender                 :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  unconfirmed_email      :string
#  user_name              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  rolify
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
  has_many :comments, through: :plans
  has_many :likes, dependent: :destroy

  has_noticed_notifications model_name: 'Notification'
  has_many :notifications, as: :recipient, dependent: :destroy
  before_create :set_default_avatar
  after_create :assign_default_role
  scope :user_active, -> { where deactivated: false }

  def assign_default_role
    add_role(:user) if roles.blank?
  end

  def set_default_avatar
    avatar.attach(
      io: File.open(File.join(Rails.root, 'app/javascript/images/avatar_default.jpg')),
      filename: 'avatar_default.jpg'
    )
  end

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

  def active_for_authentication?
    super && !deactivated
  end
end
