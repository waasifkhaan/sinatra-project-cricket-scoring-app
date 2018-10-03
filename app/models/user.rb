class User < ActiveRecord::Base
  has_many :games
  has_secure_password
  validates :name , presence: true
  validates_uniqueness_of :name
  validates :email_address , presence: true
  validates_uniqueness_of :username
  validates_uniqueness_of :email_address
  validates :username , presence: true
  end
