user = [
  {username: "ali", password: "password1"},
  {username: "abu", password: "password2"},
  {username: "lee", password: "password3"},
  {username: "jim", password: "password4"},
  {username: "tim", password: "password5"},
]
  
def auth_user(username, password, list_of_users)
  # loop through the list of users
  list_of_users.each do |user_record|
    # check if the username and password is the right one  
    if user_record[:username] == username && user_record[:password] == password
      # returns the key value pairs of the specific record
      return user_record
    end
  end
  # if it looped through and couldn't find any similiar
  "Credential were not correct"
end
  
puts "Welcome to the authenticator"
30.times { print "-" }
puts
puts "This program will take input from the user and compare password"
puts "If password is correct, you will get back the user object"
  
attempts = 1

while attempts < 4
  # get input from user
  print "Username: "
  username = gets.chomp
  print "Password: "
  password = gets.chomp

  # call auth_user function and pass in the username,password and dictionary provided
  authentication = auth_user(username, password, user)
  puts authentication

  # prompts user to run the program again or exit the program
  puts "Press n to quit or any other key to continue: "
  input = gets.chomp.downcase
  # breaks out of the while loop if user entered "n"
  break if input == "n"
  # attempts increase by one for every password and username guess
  attempts += 1
end

# Notify user when attempts = 4
puts "You have exceeded the number of attempts!"
