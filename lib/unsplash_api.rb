require 'http'
require 'yaml'
require 'unsplash'
require_relative 'picture.rb'

module SeoAssistant
    class Unsplash_API

        def initialize(keyword_str)
            config = YAML.safe_load(File.read('../config/secrets.yml'))
            @unsplash_acess_key = config["UNSPLASH_ACESS_KEY"]
            @unsplash_secret_key = config["UNSPLASH_SECRET_KEY"]
            @query = keyword_str
        end

        def unsplash_api_path(query)
            'https://api.unsplash.com/' + '/search/photos?query=' + query
        end

        def auth(acess_key)
            "Client-ID " + acess_key
        end

        def call_unsplash_url(acess_key, url)
            HTTP.headers(
                'Authorization' =>  auth(acess_key),
                ).get(url)
        end

        def get_picture()
            url = unsplash_api_path(@query)
            pictures_data = call_unsplash_url(@unsplash_acess_key, url).parse
            Picture.new(pictures_data)
            #pictures_data['results'][0]['urls']['raw']
        end
    end
end