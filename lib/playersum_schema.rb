require 'net/http'
require 'json'

class PlayersumSchema
  include ApplicationHelper

  def initialize(steamid)
    @key = Figaro.env.steam_api_key
    @steamid = steamid
    @playersum = get_playersum(@steamid)
  end

  def nickname
    @playersum["response"]["players"][0]["personaname"]
  end

  def steam_profile
    @playersum["response"]["players"][0]["profileurl"]
  end

  def avatar_small
    return @playersum["response"]["players"][0]["avatar"]
  end

  def avatar_medium
    return @playersum["response"]["players"][0]["avatarmedium"]
  end

  def avatar_large
    return @playersum["response"]["players"][0]["avatarfull"]
  end

  def get_playersum(steamid)
    response = Net::HTTP.get_response(uri(steamid))
    JSON.parse(response.body)
  end

  private

  def uri(steamid)
    URI("http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=#{@key}&steamids=#{steamid}")
  end
end
