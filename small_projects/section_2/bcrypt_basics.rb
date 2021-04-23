#Password Hashing with bcrypt
require 'bcrypt'
  
my_password = BCrypt::Password.create("my password")
#=> "$2a$12$0ZtWY7ImbuVzGKOIYsFLC.hwe2sh59y2THa06seVvir/uqyiVfvK6"
puts my_password
puts my_password == "my password"     #=> true
puts my_password == "not my password" #=> false

puts
30.times{ print "-" }
puts "\nComparing password: " 
puts my_password = BCrypt::Password.new("$2a$12$0ZtWY7ImbuVzGKOIYsFLC.hwe2sh59y2THa06seVvir/uqyiVfvK6")
puts my_password == "my password"     #=> true
puts my_password == "not my password" #=> false

