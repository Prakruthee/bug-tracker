class User < ActiveRecord::Base

 has_secure_password

 validates :name, presence: true,
           :format => { with: /\w+/ },
           :format => { with: /[A-Z]/}

 validates :email, presence: true,
            uniqueness: {message: "Email already exists"},
            :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

 validates :password, :presence => true,
           :length => {:minimum => 6}

end