class UserReport < ApplicationRecord
	belongs_to :report_user, class_name: "User"
	belongs_to :reported_user, class_name: "User"
	validates :report_message, presence: true
end
