class User < ActiveRecord::Base
      #zapusk validacij
      #validates eto prosto metod zapuskajuschij validacii
      #to zhe samoe chto i validates(:name, presence: true, i td...)

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: {case_sensentive: false}


end