class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :lockable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts

  validates :first_name, :last_name, :presence=>true
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name

  def to_s
    "#{self.first_name} #{self.last_name}"
  end
end
