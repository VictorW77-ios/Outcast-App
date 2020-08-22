class User < ActiveRecord::Base
    has_many :posts # establishes the associations
    
    has_secure_password # bcrypt macro
end 

## inheriting from ActiveRecord does a lot of the initializing work for us.