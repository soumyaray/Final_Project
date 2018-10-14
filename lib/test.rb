require 'openssl'
require "base64"
require 'yaml'

config = YAML.safe_load(File.read('../config/secrets.yml'))
key = config["MOTC_KEY"]
gmt_time ="Sat, 13 Oct 2018 13:18:57 GMT"

sig = "GQIKwSXs12/dZbmKO2UHNzcCXB8="

digest = OpenSSL::Digest.new('sha1')
time = 'x-date: ' + gmt_time
a = Base64.encode64(OpenSSL::HMAC.digest(digest, key, time))
puts "#{a.chomp}".to_s
puts "#{sig}".to_s
puts "#{a}" == "#{sig}"