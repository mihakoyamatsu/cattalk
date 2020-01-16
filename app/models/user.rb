class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :image
  has_many :posts, dependent: :destroy
  has_many :cats, dependent: :destroy
  accepts_nested_attributes_for :cats, allow_destroy: true
  has_many :user_reports, dependent: :destroy
  has_many :reminders, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_reports, dependent: :destroy
end
