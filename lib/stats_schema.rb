require 'net/http'
require 'json'

class StatsSchema
  def initialize(steamid)
    @key = Figaro.env.steam_api_key
    @steamid = steamid
    @stats = get_stats(@steamid)
  end

  def current_steamid
    @steamid
  end

  def stats_exist?
    if @stats.empty?
      return false
    else
      return true
    end
  end

  def playerStats
    @stats["playerstats"]["stats"]
  end

  def playerAchievments
    @stats["playerstats"]["achievments"]
  end

  #GAUNTLET

  def gauntlet_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_gauntlet")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def gauntlet_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_gauntlet")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #MACHINEGUN

  def machinegun_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_machinegun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def machinegun_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_machinegun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def machinegun_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_machinegun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def machinegun_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_machinegun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #SHOTGUN

  def shotgun_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_shotgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def shotgun_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_shotgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def shotgun_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_shotgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def shotgun_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_shotgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #GRENADE

  def grenade_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_grenade")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def grenade_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_grenade")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def grenade_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_grenade")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def grenade_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_grenade")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #ROCKET

  def rocket_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_rocket")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def rocket_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_rocket")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def rocket_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_rocket")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def rocket_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_rocket")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #LIGHTNING

  def lightning_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_lightning")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def lightning_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_lightning")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def lightning_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_lightning")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def lightning_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_lightning")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #RAILGUN

  def railgun_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_railgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def railgun_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_railgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def railgun_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_railgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def railgun_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_railgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #PLASMA

  def plasma_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_plasma")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def plasma_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_plasma")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def plasma_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_plasma")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def plasma_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_plasma")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #HMG

  def hmg_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_hmg")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def hmg_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_hmg")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def hmg_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_hmg")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def hmg_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_hmg")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #BFG

  def bfg_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_bfg")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def bfg_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_bfg")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def bfg_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_bfg")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def bfg_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_bfg")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #NAILGUN

  def nailgun_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_nailgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def nailgun_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_nailgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def nailgun_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_nailgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def nailgun_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_nailgun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #CHAINGUN

  def chaingun_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_chaingun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def chaingun_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_chaingun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def chaingun_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_chaingun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def chaingun_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_chaingun")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #PROXIMITY

  def proxmine_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("kill_proxmine")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def proxmine_hits
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("hits_proxmine")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def proxmine_shots
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("shots_proxmine")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def proxmine_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_proxmine")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #SPECIAL DEATH

  def water_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_water")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def slime_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_slime")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def lava_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_lava")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def telefrag_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_telefrag")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def kamikaze_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_kamikaze")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def falling_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_falling")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def self_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("mod_hurt")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #MEDALS

  def firstfrag_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_firstfrag")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def humiliation_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_gauntlet")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def excellent_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_excellent")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def revenge_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_revenge")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def combo_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_combokill")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def midair_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_midair")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def perforated_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_perforated")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def rampage_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_rampage")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def impressive_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_impressive")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def capture_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_capture")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def assist_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_assist")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def defense_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_defense")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def headshot_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_headshot")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def quadgod_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_quadgod")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def perfect_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_perfect")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def accuracy_medals
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("medal_accuracy")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  #TOTALS

  def total_kills
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("total_kills")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def total_deaths
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("total_deaths")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def wins
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("wins")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def losses
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("losses")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
  end

  def matches_played
    flag = 0
    @stats["playerstats"]["stats"].each do |stat|
      if stat.has_value?("played")
        flag = 1
        return stat["value"]
      end
    end
    if flag != 1
      return 0
    end
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
