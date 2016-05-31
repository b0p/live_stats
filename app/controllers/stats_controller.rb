require 'stats_schema'

class StatsController < ApplicationController

  def index
    if user_is_logged_in?
      @steamid = session[:user]["uid"]
      @stats = getStats(@steamid)
    end
  end

  def profile
    if user_is_logged_in?
      @nickname = session[:user]["nickname"]
      @steamid = session[:user]["uid"]
      @stats = getStats(@steamid)
    end
  end

  private

  def getStats(steamid)
    @nickname = session[:user]["nickname"]
    
    begin
      userStats = StatsSchema.new(steamid)

      if userStats.stats_exist?
        @Stat = Stat.new(nickname: @nickname,
                         steamid: steamid,
                         total_kills: userStats.total_kills,
                         total_deaths: userStats.total_deaths,
                         wins: userStats.wins,
                         losses: userStats.losses,
                         matches_played: userStats.matches_played)
        @Stat.save

        return userStats
      else
        return "No stats available for this user."
      end
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
end
