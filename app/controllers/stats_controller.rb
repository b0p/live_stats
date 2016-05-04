class StatsController < ApplicationController
  
  def index
  end

  private

  def getStats
    # Need steamid from stem login
    # steamid =
    # keep in mind, api call may fail so you may want surround this with a begin/rescue
    userStats = StatsSchema.new.get_stats()
    # perhaps create a model
    #@model = SomeModel.new(fname: api_response[:first_name], lname: api_response[:last_name])
    # etc...
  end
end
