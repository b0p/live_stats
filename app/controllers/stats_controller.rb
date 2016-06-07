require 'playersum_schema'
require 'stats_schema'

class StatsController < ApplicationController
  include ActionView::Helpers::NumberHelper

  def index
    if user_is_logged_in?
      @steamid = session[:user]["uid"]
      @stats = getStats(@steamid)
    end
    @kd_ranks = Stat.order(kd: :desc)
    @wl_ranks = Stat.order(wl: :desc)
  end

  def show
    if params[:id].nil? == false
      @stats = getStats(params[:id])
      @playerSum = getPlayersum(params[:id])
    end
  end

  private

  def getStats(steamid)
    begin
      userStats = StatsSchema.new(steamid)
      playerSum = PlayersumSchema.new(steamid)

      if userStats.stats_exist?
        if Stat.exists?(steamid: steamid)
          Stat.where(steamid: steamid).destroy_all
          @Stat = Stat.new(nickname: playerSum.nickname,
                           steamid: steamid,
                           total_kills: userStats.total_kills,
                           total_deaths: userStats.total_deaths,
                           wins: userStats.wins,
                           losses: userStats.losses,
                           matches_played: userStats.matches_played,
                           kd: kd_calc(userStats.total_kills, userStats.total_deaths),
                           wl: wl_calc(userStats.wins, userStats.losses))
          @Stat.save

          return userStats
        else
          @Stat = Stat.new(nickname: playerSum.nickname,
                           steamid: steamid,
                           total_kills: userStats.total_kills,
                           total_deaths: userStats.total_deaths,
                           wins: userStats.wins,
                           losses: userStats.losses,
                           matches_played: userStats.matches_played,
                           kd: kd_calc(userStats.total_kills, userStats.total_deaths),
                           wl: wl_calc(userStats.wins, userStats.losses))
          @Stat.save

          return userStats
        end
      else
        return "No stats available for this user.. :("
      end
    rescue SocketError => e
      render_steam_down

    rescue JSON::ParserError => e
      render_private_error
    end
  end

  def kd_calc(kills, deaths)
    result = (kills.to_f / deaths.to_f)
    number_with_precision(result, precision: 2, strip_insignificant_zeros: false).to_s
  end

  def wl_calc(wins, losses)
    result = (wins.to_f / losses.to_f)
    number_with_precision(result, precision: 2, strip_insignificant_zeros: false).to_s
  end

  def decimals(a)
    num = 0
    while(a != a.to_i)
        num += 1
        a *= 10
    end
    return num
  end
end
