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
end
