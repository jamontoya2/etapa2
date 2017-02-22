require 'Nokogiri'
require 'net/http'

class Page
  def initialize(url)
    @url = url[0..-1].join(" ")
    @response = Net::HTTP.get_response(URI(@url)).body
    @file = Nokogiri::HTML(@response)
  end

  def fetch!
	puts "url>#{@url}"
	puts "Fetching..."
	puts "Titulo: #{title}"
	puts "Links:"
	puts links
    puts "url>"
  end

  def links
    i = 0
    array = Array.new
    array2 = Array.new 	  
      @file.css('.nav-item').map do |item|
        array << item.text
        array2 << item.search("a").first["href"]
      end  
      while i <= array.length - 1
        puts "\t#{array[i]} #{array2[i]}"
        i += 1
      end	   
  end   

  def title
	name = @file.search('title').inner_text
	name  	
  end
end

class Browser
  def run!
   data = ARGV
   uno = Page.new(data)
   uno.title
   uno.fetch!
  end
end

browser = Browser.new.run!


