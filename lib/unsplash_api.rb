require 'http'
require 'yaml'
require 'unsplash'
require_relative 'picture.rb'

module SeoAssistant
	class Unsplash_API

		def initialize(access_key, keyword_str)
			@unsplash_access_key = access_key
			@query = keyword_str
		end

		def unsplash_api_path(query)
			'https://api.unsplash.com/' + '/search/photos?query=' + query
		end

		def auth(access_key)
			"Client-ID " + access_key
		end

		def call_unsplash_url(access_key, url)
			HTTP.headers(
					'Authorization' =>  auth(access_key),
					).get(url)
		end

		def get_picture()
			url = unsplash_api_path(@query)
			pictures_data = call_unsplash_url(@unsplash_access_key, url).parse
			Picture.new(pictures_data)
			#pictures_data['results'][0]['urls']['raw']
		end
	end
end

#config = YAML.safe_load(File.read('../config/secrets.yml'))
#access_key =  config["UNSPLASH_ACCESS_KEY"]

#include SeoAssistant
#search_pic = Unsplash_API.new(access_key,"dog")
#puts search_pic.get_picture.url