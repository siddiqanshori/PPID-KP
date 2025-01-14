# app/mailers/users/mailer.rb
class Users::Mailer < ApplicationMailer
  default from: 'no-reply@example.com'

  # Menangani pengiriman email konfirmasi pendaftaran
  def confirmation_instructions(user, token)
    @user = user
    @token = token
    mail(to: @user.email, subject: 'Konfirmasi Pendaftaran Anda')
  end

  # Menangani pengiriman email perubahan email
  def email_changed(user)
    @user = user
    mail(to: @user.email, subject: 'Perubahan Email Anda')
  end

  # Menangani pengiriman email perubahan password
  def password_change(user)
    @user = user
    mail(to: @user.email, subject: 'Perubahan Password Anda')
  end

  # Menangani pengiriman email reset password
  def reset_password_instructions(user, token)
    @user = user
    @token = token
    mail(to: @user.email, subject: 'Instruksi Reset Password')
  end
end
