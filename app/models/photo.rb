class Photo < ApplicationRecord
	belongs_to :album
	mount_uploader :image, ImageUploader
	has_many :comments, :as => :commentable
end
