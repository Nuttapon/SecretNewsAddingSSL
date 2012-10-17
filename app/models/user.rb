class User < ActiveRecord::Base
  attr_accessible :password,:password_confirmation,:admin,:email, :fullname, :last_login, :last_logout, :password_digest, :password_reset_sent_at, :password_reset_token, :remember_token
  
  has_many :news, dependent: :destroy
  has_many :hotnews, dependent: :destroy
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :fullname, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
                    
  validates :password , presence: true, length: { minimum: 6 },:on => :create
  validates :password_confirmation, presence: true,:on => :create

  # def activate?
  #   update_attribute('activated', true)
  #   if self.activated
  #     return true
  #   else
  #     return false
  #   end
  # end

  def self.random_string(len)
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
    self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  private
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
