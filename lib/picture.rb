module SeoAssistant
	# Model of Picture
	class Picture
		def initialize(pictures_data)
			@pictures_data = pictures_data['results']
		end

		def url()
			picture = @pictures_data[0]
			urls = picture['urls']
			urls['raw']
		end

		def all_url(num = 0)
			pictures = @pictures_data[0..num-1]
			all_urls = pictures.map { |picture| picture['urls'] }
			all_url = all_urls.map { |url| url['raw'] }
		end
	end
end