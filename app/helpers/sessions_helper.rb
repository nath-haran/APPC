module SessionsHelper


  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.update_attribute(:remember_token, User.digest(remember_token))
    self.current_user = user
  end
   def signed_in?
    current_user.nil?
  end
  def current_user=(user)
    @current_user = user
  end
  def current_user
    remember_token = User.digest(cookies[:remember_token])
    @current_user ||= User.find_by(remember_token: remember_token)
  end
  def sign_out
    current_user.update_attribute(:remember_token,User.digest(User.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end


  #admin helpers
    def admin_sign_in(admin)
      
      cookies.permanent[:admin_remember_token] = admin.username
      
      
    end
     def admin_signed_in?
      @admin=Admin.find_by(username: cookies[:admin_remember_token])
      @admin.nil?
    end
    def admin_sign_out
      
      cookies.delete(:admin_remember_token)
      
    end

end

