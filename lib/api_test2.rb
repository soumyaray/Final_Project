require 'net/http'
require 'uri'

uri = URI.parse("https://ptx.transportdata.tw/MOTC/v2/Tourism/ScenicSpot/Taipei?$top=30&$format=JSON")
request = Net::HTTP::Get.new(uri)
request["Accept"] = "application/json"
request["Authorization"] = "hmac username=\"2842122ad890425388ae66aca5328745\", algorithm=\"hmac-sha1\", headers=\"x-date\", signature=\"C9YpLYeqAYA8t86SujL+2u6BKVE=\""
request["X-Date"] = "Sat, 13 Oct 2018 12:47:17 GMT"

req_options = {
  use_ssl: uri.scheme == "https",
}

response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  http.request(request)
end

puts response.code
puts response.body