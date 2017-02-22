require "sinatra"

def count_vowels(name)
vowel=0
i=0
  while i < name.length
    if name[i]=="a" || name[i]=="e" || name[i]=="i" || name[i]=="o" || name[i]=="u"
      vowel += 1     
    end
    i +=1  
  end
 
  get "/" do
    "My name is #{name} and it has #{vowel} vowels"
  end
end
count_vowels("juan armando montoya montoya")


