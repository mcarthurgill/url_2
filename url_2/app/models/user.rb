class User < ActiveRecord::Base
  validates :name, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true

  has_many :urls
end
