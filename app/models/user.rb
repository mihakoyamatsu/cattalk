class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  has_many :posts, dependent: :destroy

  has_many :cats, dependent: :destroy
  accepts_nested_attributes_for :cats, allow_destroy: true

  has_many :reporting_relationships, foreign_key: "report_user_id",class_name: "UserReport"
  has_many :reported_users, through: :reporting_relationships, source: :reported_user

  has_many :reported_relationships,foreign_key: "reported_user_id",class_name: "UserReport"
  has_many :report_users, through: :reported_relationships, source: :report_user

  def reported_by?(user)
    reported_relationships.find_by(report_user_id: user.id).present?
  end

  #def report!(user)
    #active_reports.create!(report_user_id: user.id)
  #end

  has_many :following_relationships, foreign_key: "following_id",class_name: "Relationship",dependent: :destroy
  has_many :followers, through: :following_relationships, source: :follower

  has_many :follower_relationships, foreign_key: "follower_id", class_name: "Relationship",dependent: :destroy
  has_many :followings, through: :follower_relationships, source: :following

    def followed_by?(user)
      follower_relationships.find_by(following_id: user.id).present?
    end

    #def follow!(user)
      #following_relationships.create!(following_id: user.id)
    #end

    #def unfollow!(user)
      #following_relationships.find_by(following_id: user.id).destroy
    #end

  has_many :reminders, dependent: :destroy
  has_many :rooms, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_reports, dependent: :destroy
end
