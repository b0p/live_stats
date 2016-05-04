require 'net/http'
require 'json'
require 'pry'

module StatsSchema
  class StatsSchema
    def initialize(steamid)
      @key = Figaro.env.steam_api_key
      @steamid = steamid
      @stats = get_stats(@steamid)
    end

    def current_steamid
      @steamid
    end

    def playerStats
      @stats["stats"]
    end

    def playerAchievments
      @stats["achievments"]
    end

    def gauntlet_kills

    end

    def gauntlet_hits

    end

    def gauntlet_shots

    end

    def gauntlet_deaths

    end

    def machinegun_kills

    end

    def machinegun_hits

    end

    def machinegun_shots

    end

    def machinegun_deaths

    end

    def shotgun_kills

    end

    def shotgun_hits

    end

    def shotgun_shots

    end

    def shotgun_deaths

    end

    def grenade_kills

    end

    def grenade_hits

    end

    def grenade_shots

    end

    def grenade_deaths

    end

    def rocket_kills

    end

    def rocket_hits

    end

    def rocket_shots

    end

    def rocket_deaths

    end

    def lightning_kills

    end

    def lightning_hits

    end

    def lightning_shots

    end

    def lightning_deaths

    end

    def railgun_kills

    end

    def railgun_hits

    end

    def railgun_shots

    end

    def railgun_deaths

    end

    def plasma_kills

    end

    def plasma_hits

    end

    def plasma_shots

    end

    def plasma_deaths

    end

    def hmg_kills

    end

    def hmg_hits

    end

    def hmg_shots

    end

    def hmg_deaths

    end










    def total_kills
      @stats["playerstats"]["stats"][50]["value"]
    end

    def total_deaths
      @stats["playerstats"]["stats"][51]["value"]
    end

    def wins
      @stats["playerstats"]["stats"][47]["value"]
    end

    def losses
      @stats["playerstats"]["stats"][48]["value"]
    end

    def matches_played
      @stats["playerstats"]["stats"][49]["value"]
    end

    def get_stats(steamid)
      response = Net::HTTP.get_response(uri(steamid))
      JSON.parse(response.body)
    end

    private

    def uri(steamid)
      URI("http://api.steampowered.com/ISteamUserStats/GetUserStatsForGame/v0002/?appid=282440&key=#{@key}&steamid=#{steamid}")
    end
  end
end
