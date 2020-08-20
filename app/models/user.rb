class User < ActiveRecord::Base
    has_many :posts
    
    has_secure_password 
end 

## inheriting from ActiveRecord does a lot of the initializing work for us.