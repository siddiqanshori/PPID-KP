# frozen_string_literal: true

Devise.setup do |config|
  # The secret key used by Devise to generate random tokens.
  # You can set this key manually or use the default secret_key_base.
  # config.secret_key = 'your_secret_key_here'

  # ==> Controller configuration
  # Configure the parent class for Devise controllers
  # config.parent_controller = 'DeviseController'

  # ==> Mailer Configuration
  # Configure the email address used in Devise::Mailer.
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'
  config.mailer = 'Users::Mailer'

  # Configure the mailer class responsible for sending emails.
  # config.mailer = 'Devise::Mailer'

  # Configure the parent class for mailers.
  # config.parent_mailer = 'ActionMailer::Base'

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and :mongoid.
  require 'devise/orm/active_record'

  # ==> Authentication mechanism configuration
  # Configure the keys used for authentication. Default is :email.
  config.authentication_keys = [:email]

  # Configure request parameters for authentication.
  # config.request_keys = []

  # Configure case-insensitive authentication keys.
  config.case_insensitive_keys = [:email]

  # Configure which authentication keys should have whitespace stripped.
  config.strip_whitespace_keys = [:email]

  # Configure if authentication through request.params is enabled.
  # config.params_authenticatable = true

  # Configure if HTTP Auth is enabled for authentication.
  # config.http_authenticatable = false

  # Configure whether authentication should return 401 status code for AJAX requests.
  config.http_authenticatable_on_xhr = true

  # The realm used in Http Basic Authentication.
  config.http_authentication_realm = 'Application'

  # ==> Session configuration
  # Skip session storage for certain strategies.
  config.skip_session_storage = [:http_auth]

  # Clean up CSRF token on authentication to prevent CSRF token fixation attacks.
  # config.clean_up_csrf_token_on_authentication = true

  # Configure whether Devise reloads routes on eager load.
  # config.reload_routes = true

  # ==> Password configuration
  # Set the number of bcrypt password hashing iterations.
  config.stretches = Rails.env.test? ? 1 : 12

  # Set up a pepper to generate hashed passwords.
  # config.pepper = 'your_pepper_here'

  # Configure the password length.
  config.password_length = 6..128

  # Configure email format validation.
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Timeoutable configuration
  # Set the timeout period for user sessions.
  # config.timeout_in = 30.minutes

  # ==> Lockable configuration
  # Configure account locking strategy (e.g., failed attempts).
  config.lock_strategy = :failed_attempts

  # Configure the number of authentication tries before locking an account.
  config.maximum_attempts = 5

  # Configure the time interval to unlock an account if :time is used.
  config.unlock_in = 1.hour

  # ==> Recoverable configuration
  # Set the reset password expiration time.
  config.reset_password_within = 6.hours

  # Configure automatic sign-in after password reset.
  # config.sign_in_after_reset_password = true

  # ==> Encryptable configuration
  # Configure the encryption algorithm used for passwords.
  # config.encryptor = :sha512

  # ==> Scopes configuration
  # Configure scoped views (use scoped views for specific resources).
  # config.scoped_views = false

  # Configure the default scope used by Devise.
  # config.default_scope = :user

  # Configure sign-out behavior for multiple scopes.
  config.sign_out_all_scopes = true

  # ==> OmniAuth configuration
  # Configure OmniAuth providers (e.g., Facebook, Google).
  # config.omniauth :facebook, 'APP_ID', 'APP_SECRET', scope: 'email'

  # ==> Configuration for :confirmable
  # Allow unconfirmed users to access the site for a limited time after registration.
  config.allow_unconfirmed_access_for = 2.days

  # Set the confirmation period for tokens.
  config.confirm_within = 3.days

  # Require confirmation for email changes.
  config.reconfirmable = true

  # ==> Rememberable configuration
  # Set the time the user will be remembered without re-authentication.
  # config.remember_for = 2.weeks

  # Invalidate all remember_me tokens on sign-out.
  config.expire_all_remember_me_on_sign_out = true

  # ==> Timeoutable configuration
  # Set the timeout period for user sessions.
  # config.timeout_in = 30.minutes

  # ==> Secure password recovery
  # Allow users to reset passwords with reset password keys.
  # config.reset_password_keys = [:email]

  # ==> Configuration for :lockable
  # Enable locking strategy after a number of failed login attempts.
  config.lock_strategy = :failed_attempts
  config.maximum_attempts = 5
  config.unlock_in = 1.hour
end
