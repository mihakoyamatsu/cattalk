class Cat < ApplicationRecord
	belongs_to :user
	has_many :cat_images, dependent: :destroy
	accepts_attachments_for :cat_images, attachment: :image
	validates :blood_type, presence: true
	validates :name, presence: true
	validates :status, presence: true

	enum sex: {
        オス:0, オス去勢済み:1 ,メス:2,メス避妊済み:3
	}
	enum blood_type: {
		A型:0, B型:1, AB型:2,不明:3,その他:4
	}

	enum purpose:{
		供血を希望している:0,輸血を希望している:1,どちらも希望しない:2
	}
	enum status:{
		希望中:0,希望終了:1,一時中断:2
	}

end
