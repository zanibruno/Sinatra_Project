class User < ActiveRecord::Base
  has_many :appointments
has_secure_password validations: false

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true


end
