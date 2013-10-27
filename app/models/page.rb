class Page < ActiveRecord::Base
	has_many :page_photos
	has_many :photos, through: :page_photos

	
end
