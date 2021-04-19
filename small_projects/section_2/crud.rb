#Containing methods for hashing and authenthicating passwords
module Crud
    require 'bcrypt'
    puts "CRUD Module Activated"

    # Use self. or class_name.method_name to let other files have access to the methods
    #Hashing a password
    def create_hash_password(password)
        BCrypt::Password.create(password)
    end

    # Pass in the hashed password and compare with original string
    def verify_hash_password(password)
        BCrypt::Password.new(password)
    end

    #Hash each password
    def create_secure_users(list_of_users)
        list_of_users.each do |user_record|
            user_record[:password] = create_hash_password(user_record[:password])
        end
        list_of_users
    end

    # Authenticate user
    def authenticate_user(username, password, list_of_users)
        list_of_users.each do |user_record|
            if user_record[:username] == username && verify_hash_password(user_record[:password]) == password
                return user_record
            end
        end
        "Credential were not correct"
    end
end
