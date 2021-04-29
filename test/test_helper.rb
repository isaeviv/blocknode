ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all


  # true esli testovyj user sovershil vhod
  def is_logged_in?
    !session[:user_id].nil?
  end

  #osuscestvljaet vhod testovogo usera
  #vnutri int testov mozhno otpranit' zapros k session_path
  #no v drugih testah eto ne srabotaet, no s rabotaet s metodom session
  #poetomu zdes' opredeljaem tip testa
  def log_in_as(user, options = {})
    password = options[:password] || 'password'
    remember_me = options[:remember_me] || '1'
    if integration_test?
      post login_path, session: {email: user.email, password: password,
                                  remember_me: remember_me}
    else
      session[:user_id] = user.id
    end
  end

  #vozvrascaet true vnutri integration test
  #post_via_redirect dostupen tol'ko v int testah
  def integration_test?
    defined?(post_via_redirect)
  end

end
