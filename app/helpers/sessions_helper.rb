module SessionsHelper

  #osuscestvljaet vhod usera
  #vremennaja sessija v kukah, ror vse sama shifruet
  def log_in(user)
    session[:user_id] = user.id
  end

  #vozvrascaet tekuscego usera, esli on est'
  def current_user
     @current_user ||= User.find_by(id: session[:user_id])
  end

  #istina esli user zashel
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
