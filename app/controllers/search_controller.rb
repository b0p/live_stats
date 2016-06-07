class SearchController < ApplicationController
  def index
    @stats_count = Stat.distinct.count('steamid')
    if valid_search?
      redirect_to "/stats/#{search_params}"
    else
      render :template => 'search/index'
    end
  end

  private

  def valid_search?
    if params[:idSearch].nil? == false
      if is_i?(params[:idSearch])
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def search_params
    params[:idSearch]
  end

  def is_i?(string)
    true if Float(string) rescue false
  end
end
