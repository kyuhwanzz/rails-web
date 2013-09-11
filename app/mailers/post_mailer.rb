class PostMailer < ActionMailer::Base
  require 'openssl'
  require 'digest/sha1'

  default from: "msdn.isdg@gmail.com"

  def send_email_notification(post)
    @post = post
    @url = "http://54.213.40.168/posts/"

    mailer = Mailer.first

    delivery_config = {
        address: mailer.address,
        port: mailer.port,
        domain: mailer.domain,
        user_name: mailer.user_name,
        password: decrypt_password(mailer.user_name, mailer.password),
        authentication: mailer.auth,
        enable_starttls_auto: mailer.tls,
    }

    mail(to: "kyuhwanzz@nate.com", subject: "A new post was added",
        delivery_method_options: delivery_config)
  end

  private
    def decrypt_password(key, enc)
      cipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
      cipher.decrypt
      cipher.key = Digest::SHA1::hexdigest(key)
      cipher.iv = '0123456789abcdef'
      dec = cipher.update(Base64.decode64(enc)) + cipher.final
    end
end
