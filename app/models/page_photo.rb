class PagePhoto < ActiveRecord::Base
	belongs_to :page
	belongs_to :photo
end
