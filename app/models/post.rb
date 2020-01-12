class Post < ApplicationRecord
    has_many :post_images, dependent: :destroy
    accepts_nested_attributes_for :post_images
    attachment :image
    has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end
    has_many :comments, dependent: :destroy
    has_many :post_reports, dependent: :destroy
end

