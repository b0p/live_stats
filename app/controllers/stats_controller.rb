class StatsController < ApplicationController
  include StatsSchema

  def index
    @steamid = session[:user]["uid"]
    @stats = getStats(@steamid)

  end

  private

  def getStats(steamid)
    @nickname = session[:user]["nickname"]
    # keep in mind, api call may fail so you may want surround this with a begin/rescue
    userStats = StatsSchema.new(steamid)    #.get_stats(steamid)

    @Stat = Stat.new(nickname: @nickname,
                     steamid: steamid,
                     total_kills: userStats.total_kills,
                     total_deaths: userStats.total_deaths,
                     wins: userStats.wins,
                     losses: userStats.losses,
                     matches_played: userStats.matches_played)
  end
end
