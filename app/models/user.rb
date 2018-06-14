class User < ActiveRecord::Base


  has_many :issues
  has_many :comments
  has_secure_password :validations => false

  validates :name, presence: true,
            :unless => proc{|u| u.provider.present?}

  validates :username, presence: true,
            uniqueness: true,
            :length => {:minimum => 6, :maximum => 256},
            :format => {:with => /\A[0-9\_\.]*[a-zA-Z]+[0-9\_\.]*\z/ },
            :unless => proc{|u| u.provider.present?}

  validates :email, presence: true,
            uniqueness: true,
            :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i },
            :unless => proc{|u| u.provider.present?}

  validates :password, :presence => true,
            :length => {:minimum => 6},
            :unless => proc{|u| u.provider.present?}

  # mount_uploader :image, ImageUploader

  def self.authenticate(username, password)
    user = find_by_username(username)
    if user && user.password_digest == BCrypt::Engine.hash_secret(password, user.password_digest)
      user
      else
      nil
    end
  end

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.oauth_token = auth['oauth_token']
      if auth['info']
        user.name = auth['info']['name'] || ""
      end
    end
  end
end