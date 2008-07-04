module Authenticate
  def authenticate
    authenticated? || deny_authentication
  end
  def authenticated?
    session[:password] ? (CONFIG['password'] == session[:password]) : false
  end
  def deny_authentication
    flash[:now] = "Authentification refusée"
    #redirect_to request.request_uri
  end
end
