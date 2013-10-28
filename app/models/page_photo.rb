class PagePhoto < ActiveRecord::Base
	belongs_to :page
	belongs_to :photo
	default_scope { order('sort_order asc') }
end