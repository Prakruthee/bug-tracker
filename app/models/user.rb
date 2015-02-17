class User < ActiveRecord::Base

 has_secure_password

 validates :name, presence: true

 validates :username, presence: true,
            uniqueness: {message: "Username already exists"},
            :length => {:minimum => 6, :maximum => 256},
            :format => {:with => /\A[0-9\_\.]*[a-zA-Z]+[0-9\_\.]*\z/ }

 validates :email, presence: true,
            uniqueness: {message: "Email already exists"},
            :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

 validates :password, :presence => true,
           :length => {:minimum => 6}

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_digest)
      user
      else
      nil
    end
  end

end