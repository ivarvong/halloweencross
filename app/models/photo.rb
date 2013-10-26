class Photo < ActiveRecord::Base
	has_many :page_photos
	has_many :photos, through: :page_photos

	def url_for_size(size_string)
		if self.sizes[size_string].present?
			self.sizes[size_string] # this is a URL. CloudFront or key?
		else
			logger.warn ("no size for #{size_string} for photo #{self.id}")
			"no version of that size yet"
		end
	end

end