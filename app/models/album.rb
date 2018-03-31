class Album < ApplicationRecord
	has_many  :photos, dependent: :destroy
	has_many :comments, :as => :commentable

	belongs_to :users
end
