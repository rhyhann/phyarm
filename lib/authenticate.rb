module Authenticate
  def authenticate
    authenticated?
  end
  def authenticated?
    session[:password] ? (CONFIG['password'] == session[:password]) : false
  end
end
