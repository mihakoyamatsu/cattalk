class Cat < ApplicationRecord
	belongs_to :user
	attachment :image
end
