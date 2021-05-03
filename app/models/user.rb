require 'bcrypt'
class User < ActiveRecord::Base

  has_many :note, dependent: :destroy
  attr_accessor :remember_token
      #zapusk validacij
      #validates eto prosto metod zapuskajuschij validacii
      #to zhe samoe chto i validates(:name, presence: true, i td...)
      #pered sohraneniem ob'ekta vyzyvaem metod before_save i perevodim pochtu v nizhnij registr
      #self.email oznachet vybor tekuschego usera
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                format: { with: VALID_EMAIL_REGEX },
                uniqueness: {case_sensentive: false}

  #otlavlivaet pustye paroli, vstroenaja validacija
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}, allow_nil:true

  #vozvrascaet dajdzhest dannoj stroki
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST:
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #generiruet sluchajnyj token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #zapominaet usera v baze dannyh dlja ispol'zovanija v postojannoj sessii
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  #vernet true esli token sovpadet s dajdzhestom
  #zdesj argument - eto novaja lokalnaja peremennaja (ne attr_accessor)
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  #zabyvaet usera
  def forget
    update_attribute(:remember_digest, nil)
  end

end
