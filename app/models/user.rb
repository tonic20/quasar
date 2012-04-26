class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :nickname, :email, :password, :password_confirmation, :remember_me
  
  attr_accessor :login
  
  
  
  # Class methods
  class << self
  
    # Replacement for authentication with login in Devise
    def find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      login = conditions.delete(:login).downcase
      where(conditions).where(["lower(nickname) = :value OR lower(email) = :value", { value: login.downcase }]).first
    end
    
  end
end
