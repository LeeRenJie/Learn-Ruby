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
puts "The number of characters of your name is #{fullname.length - 1}"

#Calculator program
puts"Simple Calculator"
25.times {print"-"} 
puts "\nEnter your first number"
first_number=gets.chomp.to_f
puts "Enter your second number"
second_number=gets.chomp.to_f
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
 

#16~