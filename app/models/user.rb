class User < ActiveRecord::Base
  ROLES = %w[admin moderator reader]

  # validations
  validates :nickname, presence: true, length: { minimum: 3, maximum: 20 }
  validates :first_name, length: { minimum: 2, maximum: 20 }
  validates :last_name,  length: { minimum: 2, maximum: 20 }
  validates :role, inclusion: { in: ROLES }
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :nickname, :first_name, :last_name, :role, :email, :password, :password_confirmation, :remember_me
  
  attr_accessor :login
  
  def full_name
    "#{first_name} #{last_name}"
  end
    
  ROLES.each do |r|
    define_method "is_#{r}?" do 
      role == r
    end
  end
  
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
