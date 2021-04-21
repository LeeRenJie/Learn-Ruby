# 1 ~ 11
# Section 1: Lets code the quiz!

address = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# var = address array is the rest

p address
# p = print

p address[5]
# print the number with index 5 

new_address = address.reverse!
# .reverse! is a method that comes with ruby

p new_address
# reversed list


#12~15
# Hello world in multiple ways

# Simple Put String
print "Hello World"
puts "Hello World"
p "Hello World"

# Using a variable
greeting = "hello world"
puts greeting

# # Using a method
def said_hello(things_to_say)
  puts things_to_say
end
# 
said_hello("Hello World")

#String conatenation
first_name = "Lee"
last_name = "RJ"
puts first_name + " " + last_name

#String interpolation
first_name = "Lee"
last_name = "RJ"
puts "My first name is #{first_name} and my last name is #{last_name}"

#find data type(class) with .class
first_name = "Lee"
last_name = "RJ"
p first_name.class

#Find methods
first_name = "Lee"
last_name = "RJ"
p first_name.methods

#Escape with \ (Used to escape special characters)
name = "Ali"
p "name is \#{name}" 
print 'He said:\'Hi\''

# `.length` sees the str length

# `.reverse` reverse the str
# `.empty?` returns a boolean to check whether the str is empty
# `.nil?` returns a boolean to check if there is value ("".nil? returns false because empty string still has some soft of value. nil.nil? returns true)
# Replace words with `.sub("Original string", "new string")`
# `.gsub("OG","new") replaces all the original string to the new string stated.


# 16 ~ 23 
# .to_i converts str into integer
# 10/4 will equals to 2 because ruby inteprets it as integer and drops the decimal. Have to make one of the number a float for it to show decimal. eg: 10.0/4 will equals to 2.5 or 10/4.to_f convert integers to float.
# ruby takes it as integer divide by integer = integer. Hence, it will be an integer value. This isn’t just tied to ruby but almost all loosely typed language. Loosely typed language is a language that you do not define its type.
# (10/4).to_f will equals to 2.0 as Ruby will evaluate the equation in the brackets first then convert the answer into float
# You can do concat with "5" * 2 but not 2 * "5". because a string can be multiplied by two but 2 cannot multiply a string.
# .times. For example 20.times {print "-"} will print a line of 20 dashes.
# rand(10) generates random number between 0 and 9
# rand generates a random number between 0 and 1
# .to_i converrts into integer
# if a string cant be converted into integer/float it will become 0. eg "hello".to_i = 0 "hello".to_f = 0.0
# .odd?, .even? to check if the number is odd or even
# comparison operators, ==, !=,>,<,>=,<=- compare classes(type)10.eql?(10.0)=false`. One is int one is float
# define method with arguments(functions)
# Declaration of methods has to be before using the methods.

# get.chomp gets the user input, gets you a string even if input is a number.
puts "What is ur first name?"
first_name = gets.chomp
puts "fname is #{first_name}"

#to_i converts str into int
puts "number to muliply by 2"
input = gets.chomp
puts input.to_i * 2

#Analyzer program
puts "What is your first name?"
fname = gets.chomp
puts "What is ur last name?"
lname = gets.chomp

fullname = fname + " " + lname
puts "Your full name is #{fullname}"
puts "Your reversed name is #{fullname.reverse}"
puts "The number of alphabets of your name is #{fullname.length - 1}"

#Calculator program
puts "Simple Calculator"
25.times { print "-" } 
puts "\nEnter your first number"
first_number = gets.chomp.to_f
puts "Enter your second number"
second_number = gets.chomp.to_f
puts "The multiplication of both number is #{first_number * second_number}"
puts "The division of both number is #{first_number / second_number}"
puts "The addition of both number is #{first_number + second_number}"
puts "The subtraction of both number is #{first_number - second_number}"
puts "The modulus of both number is #{first_number % second_number}"

#Define method with arguments
def multiply(first_num, second_num)
  first_num.to_f * second_num.to_f
end

puts multiply(1,2)

# 24 ~ 27
# Branching if/else/elseif/end
condition = true
another_condition = false
if (condition || another_condition)
  puts "Condition True"
else 
  puts "Condition False"
end

#elsif 
name = "Jack"
if name == "lee"
  puts "Hi lee"
elsif name == "Jack"
  puts "Hi Jack"
else
  puts "Hi everyone"
end

#Calculator with if/else
puts "Simple Calculator"
25.times { print"-" } 
puts "\nEnter your first number"
first_number = gets.chomp.to_f
puts "Enter your second number"
second_number = gets.chomp.to_f
puts "Enter 1 to multiply, 2 to divide, 3 to add, 4 to subtract, and 5 to find remainder"
choice = gets.chomp
puts "You selected #{choice}"
if choice == '1'
  puts "Both number multiplied is #{first_number * second_number}"
elsif choice == '2'
  puts "Both number divided is #{first_number / second_number}"
elsif choice == '3'
  puts "Both number added is #{first_number * second_number}"
elsif choice == '4'
  puts "Both number subtracted is #{first_number - second_number}"
elsif choice == '5'
  puts "Remainder is #{first_number % second_number}"
else
  puts "Invalid input. Please enter 1 to 5"
end

## Arrays and iterators
y = [1,2,3,4,5]
# print last item in array
puts y.last

# Create a range of numbers
x = 1..10
puts x.class

# convert the range to array
new_array = x.to_a
puts new_array

# Shuffle the array
print new_array.shuffle

# A range of letters to array
alphabets = "a".."z"
print alphabets.to_a.shuffle

# Add to end 
new_array << 11
print new_array
print new_array.append(11)
puts

# Add to front
print new_array.unshift(11)
puts

# Remove duplicate
print new_array.uniq
puts

#check if item is in array
puts new_array.include?(10)

#push and pop
new_array.push("new item")
print new_array
popped_item = new_array.pop
puts popped_item
print new_array

# .join takes all the items in the array and turns it into a string
joined_array = new_array.join
print joined_array

#Add a dash in the middle of the joined array
dashed_join = new_array.join("-")
print dashed_join

# split the items into an array
print dashed_join.split("-")

#Iterators /loop
#for loop
array_loop = [1, 2, 3, 4, 5]
for i in array_loop
  puts i
end

#.each method
array_loop.each do |rand_name|
  puts rand_name 
end

# or

array_loop.each { |random_var| print random_var }

#.select
z = (1..100).to_a.shuffle
print z.select { |number| number.odd? }


# 28 ~ 41
# Hashes/dictionary

#Key value pair
sample_hash = { "a" => 1, "b" => 2, "c" => 3 }

#Access the value in the hash using the key
print sample_hash["a"]

# Using symbols as identifiers/keys

symbol_hash = { a: 1, b: 2, c: 3 }
# it wil become { :a => 1, :b => 2, :c => 3 }
print symbol_hash[:a]

# To find keys
print sample_hash.keys

#To find values
print sample_hash.values

# Looping 
sample_hash.each do |key, value|
  puts "The class for key is #{key.class} and the value is #{value.class}"
end

#or

sample_hash.each { |key, value| puts "The key is #{key} and the value is #{value}" }

# Adding key value pair into hash
symbol_hash[:d] = "Hello"
print symbol_hash

# change value with the key
symbol_hash[:d] = "Bye"
print symbol_hash

# conditional. Returns values that is a string
print symbol_hash.select { |key, value| value.is_a?(String) }

# Delete the key if values if value is a string. No key = no value
symbol_hash.each { |key, value| symbol_hash.delete(key) if value.is_a?(String) }
print symbol_hash


# 42 ~
# Object oriented programming
#  Definition
#Object-oriented programming (OOP) is a programming paradigm that uses objects and their interactions to design and program applications.
puts

# Class
class Student 
  attr_accessor :first_name, :last_name, :email, :username, :password 

  def initialize(firstname, lastname, username, email, password)
    @first_name = firstname
    @last_name = lastname
    @email = email
    @username = username
    @password = password
  end

  def to_s
    "First name: #{@first_name}\nLast name: #{@last_name}\nUsername: #{@username}\nEmail address: #{@email} "
  end 

end

lee = Student.new("Lee", "RJ", "lrj", "rj.email.com", "lrj123")
john = Student.new("John", "Lim", "John1", "John@email.com", "john123")

puts lee
puts
puts john
puts
# Object interactions
lee.last_name = john.last_name
puts "lee's last name is altered"
puts lee

