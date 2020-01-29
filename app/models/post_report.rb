class PostReport < ApplicationRecord
	belongs_to :user
	belongs_to :post
	validates :report_message, presence: true
end
