require 'http'
require 'yaml'
require 'time'
require 'openssl'
require "base64"


module TripOrganization
	class MOTC_API
		def initialize(city,topnum)
			config = YAML.safe_load(File.read('../config/secrets.yml'))
			@motc_key = config["MOTC_KEY"]
			@motc_id_name = config["MOTC_ID_NAME"]
			@city = city
			@topnum = topnum
		end

		def motc_api_path(location,num)
			'https://ptx.transportdata.tw/MOTC/v2/Tourism/ScenicSpot/' + location +'?$top=' + "#{num}" +'&$format=JSON'
		end

		def GMT_time()
			"#{Time.new.httpdate}"
		end

		def auth(id_name, key, gmt_time)
			"hmac username=\"" + id_name + "\", algorithm=\"hmac-sha1\", headers=\"x-date\", signature=\"" + signature(key, gmt_time) + "\""
		end

		def signature(key,gmt_time)
			digest = OpenSSL::Digest.new('sha1')
			time = 'x-date: ' + gmt_time
			Base64.encode64(OpenSSL::HMAC.digest(digest, key, time)).chomp
		end


		def call_motc_url(id_name, key, url, gmt_time)
			HTTP.headers(
				'Accept' =>  'application/json',
				'Authorization' =>  auth(id_name, key, gmt_time),
				'x-date' => gmt_time
				).get(url)
		end

		def get_data()
			url = motc_api_path(@city, @topnum)
			get_time = GMT_time()
			project = call_motc_url(@motc_id_name, @motc_key, url, get_time).parse
			
		end
	end
end