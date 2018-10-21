require 'http'
require 'yaml'
require 'unsplash'
require_relative 'picture.rb'

module SeoAssistant
	# Library of Unsplash API
	class Unsplash_API
		def initialize(access_key, keyword_str)
			@unsplash_access_key = access_key
			@query = keyword_str
		end

		def get(url)
			HTTP.headers(
					'Authorization' =>  "Client-ID " + @unsplash_access_key,
					).get(url)
		end

		def get_picture()	
			path = 'https://api.unsplash.com/' + '/search/photos?query=' + @query
			pictures_data = get(path).parse
			Picture.new(pictures_data)
		end
	end
end
