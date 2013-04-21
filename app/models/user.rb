class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :phone, :role
  has_many :suggestions

end
