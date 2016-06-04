module ApplicationHelper
  def user_is_logged_in?
   if session[:user].nil?
     return false
   else
     return true
   end
 end

 def getPlayersum(steamid)
   begin
     userSum = PlayersumSchema.new(steamid)
     return userSum
   rescue SocketError => e
     render_steam_down
   end
 end

 def render_steam_down
   respond_to do |format|
     format.html { render template: 'errors/no_steam', status: 404 }
     format.all { render nothing: true, status: 404 }
   end
 end

 def render_private_error
   respond_to do |format|
     format.html { render template: 'errors/private_profile', status: 400 }
     format.all { render nothing: true, status: 400 }
   end
 end
end
