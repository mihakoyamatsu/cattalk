class Post < ApplicationRecord
	belongs_to :user
    has_many :post_images, dependent: :destroy
    accepts_attachments_for :post_images, attachment: :image
    has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
    has_many :comments, dependent: :destroy
    has_many :post_reports, dependent: :destroy

    def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
end
