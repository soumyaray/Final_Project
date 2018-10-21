module SeoAssistant
	class Picture
		def initialize(pictures_data, num = 0)
			@all_pictures = pictures_data['results']
			@pictures = pictures_data['results'][0..num-1]
			@picture = pictures_data['results'][0]
		end

		def url()
			urls = @picture['urls']
			urls['raw']
		end

		def all_url()
			all_urls = @pictures.map { |picture| picture['urls'] }
			all_url = all_urls.map { |url| url['raw'] }
		end
	end
end