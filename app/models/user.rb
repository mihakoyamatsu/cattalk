class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def active_for_authentication?
    super && (self.is_deleted == nil)
  end

  attachment :image
  has_many :posts, dependent: :destroy

  has_many :cats, dependent: :destroy


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
  has_many :direct_messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  has_many :reminders, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_reports, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20}
  validates :email, presence: true, uniqueness: true
  validates :introduce, length: {maximum: 100}

  enum prefectures: {
        北海道:0,青森県:1,岩手県:2,宮城県:3,秋田県:4,山形県:5,福島県:6,茨城県:7,栃木県:8,群馬県:9,埼玉県:10,千葉県:11,東京都:12,神奈川県:13,新潟県:14,富山県:15,石川県:16,福井県:17,山梨県:18,長野県:19,岐阜県:20,静岡県:21,愛知県:22,三重県:23,滋賀県:24,京都府:25,大阪府:26,兵庫県:27,奈良県:28,和歌山県:29,鳥取県:30,島根県:31,岡山県:32,広島県:33,山口県:34,徳島県:35,香川県:36,愛媛県:37,高知県:38,福岡県:39,佐賀県:40,長崎県:41,熊本県:42,大分県:43,宮崎県:44,鹿児島県:45,沖縄県:46
      }
end
