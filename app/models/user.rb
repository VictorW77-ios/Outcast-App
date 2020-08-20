class User < ActiveRecord::Base
    has_secure_password 
    has_many :posts
end 

## inheriting from ActiveRecord does a lot of the initializing work for us.