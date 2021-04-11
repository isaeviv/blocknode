module SessionsHelper

  #osuscestvljaet vhod usera
  #vremennaja sessija v kukah, ror vse sama shifruet
  def log_in(user)
    session[:user_id] = user.id
  end

  #zapomimnaet voshedshego pol'zovatelja
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  #vozvrascaet uzera sootvetstvujuscemu remember tokenu v kuki
  def current_user
  #esli v sesii est' user s takim id
   if (user_id = session[:user_id])
     @current_user ||= User.find_by(id: user_id)
   elsif (user_id = cookies.signed[:user_id])
     user = User.find_by(id: user_id)
     if user && user.authenticated?(cookies[:remember_token])
       log_in user
       @current_user = user
     end
   end
  end

  #istina esli user zashel
  def logged_in?
    !current_user.nil?
  end

  #tovarisc Zabyvalkin
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

end
