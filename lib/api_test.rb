require 'http'
require 'yaml'
require 'time'
require 'openssl'
require "base64"

config = YAML.safe_load(File.read('../config/secrets.yml'))
motc_key = config["MOTC_KEY"]
motc_id_name = config["MOTC_ID_NAME"]
request_URL = "https://ptx.transportdata.tw/MOTC/v2/Tourism/ScenicSpot/Taipei?$top=3&$format=JSON"

def motc_api_path(location,num)
	'https://ptx.transportdata.tw/MOTC/v2/Tourism/ScenicSpot/' + location +'?$top=' + "#{num}" +'&$format=JSON'
end

def GMT_time()
	"#{Time.new.httpdate}"
end

def auth(id_name, key)
	'hamc username ="' + id_name + '", algorithm="hmac-sha1", headers="x-date", signature=' + signature(key,GMT_time()).chomp.to_s + '"'
end

def signature(key,gmt_time)
	digest = OpenSSL::Digest.new('sha1')
	time = 'x-date: ' + gmt_time
	Base64.encode64(OpenSSL::HMAC.digest(digest, key, time))
end


def call_motc_url(id_name, key, url)
	HTTP.headers(
		'Accept' =>  'application/json',
		'Authorization' =>  auth(id_name,key),
		'x-date' => GMT_time(),
		'Accept-Encoding' => 'gzip'
		).get(url)
end

motc_response={}

url = motc_api_path('Taipei',3)
project = call_motc_url(motc_id_name, motc_key, url).parse
puts project