class LoginController < ApplicationController
  layout 'categories'
  def index
    redirect_to :action => 'new'
  end
  def new
  end
  def create
    session[:password] = params[:login][:password]
    authenticated? ? 
      go_index('Authentification réussie') : 
      erase_pass('Authentification refusée')
  end
  def destroy
    erase_pass 'Déconnecté'
  end

private
  def go_index(notice = nil)
    flash[:now] = notice
    redirect_to categories_path
  end

  def erase_pass(notice = nil)
    flash[:now] = notice
    session[:password] = nil
    redirect_to categories_path

  end

end
