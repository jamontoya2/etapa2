require 'csv'
	
 def canonico(word)
 	word.chars.sort.join
 end		
  
  CSV.foreach("words.csv", "r") do |row| 
    Word.create(word: row[0].to_s, canonical: canonico(row[0].to_s))  
  end
 
