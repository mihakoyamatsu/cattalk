class UserReport < ApplicationRecord
	belongs_to :user
	has_many :user
end
