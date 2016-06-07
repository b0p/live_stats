class AddingIndexToSteamid < ActiveRecord::Migration
  def change
    add_index :stats, :steamid
  end
end
