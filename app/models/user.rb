class User < ActiveRecord::Base
  attr_accessible :email, :name, :password , :password_confirmation
  attr_accessor :password 
  validates :email, :name, :password,:password_confirmation, :presence => true ,:on => :create
  validates :email, :uniqueness => true
  validates :password, :confirmation => true
  validates :email, :format => { :with => /[a-zA-Z.1-9]*@[a-zA-Z.1-9][a-zA-Z.1-9]/}
  before_save :encrypt_password
  has_many :posts

  def self.authenticate(email,password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end  
  end

  def encrypt_password
    if password.present?
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
    end
  end
end
