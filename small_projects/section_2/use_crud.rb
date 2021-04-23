#Hashing an array of hashes containing password
# import module(like a tool kit) containing methods from crud.rb
require_relative 'crud'

users = [
  {username: "ali", password: "password1"},
  {username: "abu", password: "password2"},
  {username: "lee", password: "password3"},
  {username: "jim", password: "password4"},
  {username: "tim", password: "password5"},
]

# print out the hashes containing hashed password using methods from the module
hashed_users = Crud.create_secure_users(users)
puts hashed_users

# Get input from user
print "Enter your username: "
username = gets.chomp.downcase
print "Enter your password: "
password = gets.chomp

# authenticate user based on the users array, if correct will return the hash, enter password in string form and it will be hashed an compared with its hashed form
puts Crud.authenticate_user(username, password, hashed_users)
