class StatsController < ApplicationController
  include StatsSchema

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
  end
end
