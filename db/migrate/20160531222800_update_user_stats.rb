class UpdateUserStats < ActiveRecord::Migration
  def change
    add_column :stats, :kd, :decimal
    add_column :stats, :wl, :decimal
  end
end
