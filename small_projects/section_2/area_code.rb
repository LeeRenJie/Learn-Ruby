dial_book = {
  "newyork" => "212",
  "newbrunswick" => "732",
  "edison" => "988",
  "plainsboro" => "609",
  "sanfrancisco" => "301",
  "miami" => "305",
  "paloalto" => "650",
  "evanston" => "847",
  "orlando" => "407",
  "lancaster" => "717",
}

# Get city name from the hash
def get_city_names(dial_book)
  return dial_book.keys
end

# Get area code based on given hash and key
def get_area_code(dial_book, key)
  return "The area code of #{key} is #{dial_book[key]}"
end

#Execution flow
loop do
  puts "Do you want to look up an area code based on a city name?(Y/N)"
  answer = gets.chomp.downcase
  break if answer != "y"

  puts "Which city do you want the area code for?"
  puts get_city_names(dial_book)
  print "Enter your selection: "
  city_wanted = gets.chomp.downcase
  if dial_book.include?(city_wanted)
    puts get_area_code(dial_book, city_wanted)
  else
    puts "You entered an invalid city name!"
  end
end

