require 'net/http'
require 'json'
require "pry"
require 'dotenv'
Dotenv.load

class StatsSchema
  def initialize
    @key = ENV["STEAM_API_KEY"]
    @stats = get_stats["playerstats"]
  end

  def current_steamid
    @stats["steamID"]
  end

  def AllPlayerStats
    @stats["stats"]
  end

  def AllPlayerAchievments
    @stats["achievments"]
  end

  def get_stats(steamid)
    response = Net::HTTP.get_response(uri(steamid))
    JSON.parse(response.body)
  end

  private

  def uri(steamid)
    URI("http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=282440&key=C05252BEF2C30DBDC5508FB7B519423F&steamid=#{steamid}")
  end
end

StatsSchema.new
