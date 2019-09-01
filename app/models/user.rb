class User < ActiveRecord::Base 
    has_secure_password

    has_many :posts 
end 

#may need to drop tables, and re do them. I think maybe I needed to add
#above, "has_many" prior to migrating