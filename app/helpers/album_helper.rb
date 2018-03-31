module AlbumHelper
	#Album.find(1).comments
	def get_image(cover_id)
		@photo = Photo.find_by_id(cover_id)
		@photo.present? ? @photo.image : "download.jpg"
	end
end
