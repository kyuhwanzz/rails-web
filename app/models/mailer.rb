class Mailer < ActiveRecord::Base
  require 'openssl'
  require 'digest/sha1'

  validates :activate, :address, :port, :user_name, :password, presence: true

  before_create :encrypt_password

  private
    def encrypt_password
      cipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
      cipher.encrypt
      cipher.key = Digest::SHA1::hexdigest(self.user_name)
      cipher.iv = '0123456789abcdef'
      self.password = Base64.encode64(cipher.update(self.password) + cipher.final).gsub(/\s/, '')
    end
end
