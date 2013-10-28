require 'open-uri'

class Photo < ActiveRecord::Base
	has_many :page_photos
	has_many :photos, through: :page_photos

	after_create { |record|
		result = record.extract_iptc
		logger.debug("after_create did extract_iptc: #{result}")		
	}

	def url_for_size(size_string)
		if self.sizes[size_string].present?
			self.sizes[size_string] # this is a URL. CloudFront or key?
		else
			logger.warn ("no size for #{size_string} for photo #{self.id}")
			"no version of that size yet"
		end
	end

	def extract_iptc
		blob = open("http://d33hg3xs7itdqa.cloudfront.net/#{self.s3_key}").binmode.read #TODO: un-hardcode
		iptc = IPTC::JPEG::Image.from_blob(blob)

		output_hash = {}
		iptc.values.each{|item| 
			output_hash[item.key] = [item.value]
		}		
		self.iptc = output_hash
		
		self.caption ||= self.iptc['iptc/Caption'].try(:first) || ""
		self.byline  ||= self.iptc['iptc/Byline'].try(:first) || ""

		logger.error(self.inspect);

		self.save
		self
	end

end