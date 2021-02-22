class User < ActiveRecord::Base
  #zapusk validacij
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 255}


end
