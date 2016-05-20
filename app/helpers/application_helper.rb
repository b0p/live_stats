module ApplicationHelper
  def user_is_logged_in?
   if session[:user].nil?
     return false
   else
     return true
   end
 end
end
