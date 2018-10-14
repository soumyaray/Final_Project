require 'net/http'
require 'uri'
require 'yaml'
require 'time'
require 'openssl'
require "base64"

config = YAML.safe_load(File.read('../config/secrets.yml'))
motc_key = config["MOTC_KEY"]
motc_id_name = config["MOTC_ID_NAME"]
test_request_URL = "https://ptx.transportdata.tw/MOTC/v2/Tourism/ScenicSpot/Taipei?$top=3&$format=JSON"

def motc_api_path(location,num)
	'https://ptx.transportdata.tw/MOTC/v2/Tourism/ScenicSpot/' + location +'?$top=' + "#{num}" +'&$format=JSON'
end

def auth(id_name, key)
	"hamc username =\"" + id_name + "\", algorithm=\"hmac-sha1\", headers=\"x-date\", signature=\"" + signature(key,GMT_time()).chomp + "\""
end

def signature(key,gmt_time)
	digest = OpenSSL::Digest.new('sha1')
	time = 'x-date: ' + gmt_time
	Base64.encode64(OpenSSL::HMAC.digest(digest, key, time))
end

def GMT_time()
	"#{Time.new.httpdate}"
end

request_URL = motc_api_path("Taiper",3)
uri = URI.parse(request_URL)
request = Net::HTTP::Get.new(uri)
request["Accept"] = "application/json"
request["Authorization"] = auth(motc_id_name, motc_key)
request["X-Date"] = GMT_time()

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

puts response.code
puts response.body
