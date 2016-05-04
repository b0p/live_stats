class CreateUserStats < ActiveRecord::Migration
  def change
    create_table :user_stats do |t|
      t.string :nickname
      t.string :steamid
      t.string :total_kills
      t.string :total_deaths
      t.string :wins
      t.string :losses
      t.string :matches_played
    end
  end
end
