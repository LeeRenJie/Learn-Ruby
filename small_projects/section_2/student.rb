require_relative 'crud'

class Student 
  include Crud
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
  
# hashing student's password
hashed_password = lee.create_hash_password(lee.password)
puts hashed_password
