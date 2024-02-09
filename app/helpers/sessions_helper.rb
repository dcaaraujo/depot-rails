module SessionsHelper
  def user_logged_in?
    session[:user_id] != nil
  end
end
