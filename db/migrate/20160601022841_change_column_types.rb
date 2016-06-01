class ChangeColumnTypes < ActiveRecord::Migration
  def change
    remove_column :stats, :kd, :decimal
    remove_column :stats, :wl, :decimal

    add_column :stats, :kd, :string
    add_column :stats, :wl, :string
  end
end
