class Cat < ApplicationRecord
	belongs_to :user
	has_many :cat_images, dependent: :destroy
	accepts_attachments_for :cat_images, attachment: :image
	#attachment :image

	enum sex: {
        オス:0,メス:1
	}
end
