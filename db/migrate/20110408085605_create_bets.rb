class CreateBets < ActiveRecord::Migration
  def self.up
    create_table :bets do |t|
      t.integer :game_id
      t.integer :round_id
      t.integer :champion_id
      t.string :bid
      t.timestamps
    end
  end

  def self.down
    drop_table :bets
  end
end
