require 'nokogiri'
require 'net/http'


 fail("usage: Extract_links URL [URL...]") if ARGV.empty?

ARGV.each do |url|
  doc = Nokogiri::HTML(open(url))
   hrefs = doc.css("a").map do |link|
    if (href = link.attr("href")) && !href.empty?
      URI::join(url, href)
    end  
  end.compact.uniq
  STDOUT.puts(hrefs.join("\n"))
 end

# require 'net/http'

# url = URI.parse('http://www.xvideos.com/index.html')
# req = Net::HTTP::Get.new(url.to_s)
# res = Net::HTTP.start(url.host, url.port) {|http|
# 	http.request(req)
# }
# puts res.body

# res = Net::HTTP.get_response(URI('http://www.xvideos.com/index.html'))
# puts res.body

# def fetch(uri_str, limit = 10)

# 	raise ArgumentError, 'too many HTTP redirects' if limit == 0
# 	response = Net::HTTP.get_response(URI(uri_str))

# 	case response
# 	when Net::HTTPSuccess then
# 		 response
# 	when Net::HTTPRedirection then
# 		location = response['location']
# 		warn "redirected to #{location}"
# 		fetch(location, limit -1)
# 	else
# 		response.value
# 	end
# end

# print fetch('http://www.codea.mx')
