require 'Nokogiri'
require 'open-uri'

class TwitterScrapper
	def initialize(url)
	  url = url[0..-1].join(" ")	
      html_file = open(url)
      @url = Nokogiri::HTML(File.open(html_file))
	end

	def extract_username
	  puts "\n"
      profile_name = @url.search(".ProfileHeaderCard-name > a")
	  puts "Username: #{profile_name.inner_text}"
	end

	def estract_stats
	    array = Array.new
	    stats = @url  
           @url.css('.ProfileNav-value').map do |item|
	          array << item.text
           end
           puts "---------------------------------------------------------------"
           puts "Stats: Tweets: #{array[0]}, "  "Siguiendo: #{array[1]}," " Seguidores: #{array[2]}"
           puts "---------------------------------------------------------------\n"
	end

    def extract_tweets
      i=0	
    	array  = Array.new
    	array2 = Array.new 
    	array3 = Array.new

    		@url.css('.time').map do |item|
              array << item.text.gsub(/\n/,'').lstrip
    	    end 
    		@url.css('.ProfileTweet-actionCountList').map do |item|
    		  array2 << item.text.gsub(/\n/,"").lstrip
    		end
            @url.css('.js-tweet-text-container').map do |item|
    		  array3 << item.text.gsub(/\n/,"").lstrip
    		end
          puts "Tweets:\n"
          while i <= array.length 
            puts "\t#{array[i]}.: #{array3[i]}\n"
            puts  "\t#{array2[i]}\n"
            i += 1
          end  
     end
end

data = ARGV
uno = TwitterScrapper.new(data)
uno.extract_username
uno.estract_stats
uno.extract_tweets