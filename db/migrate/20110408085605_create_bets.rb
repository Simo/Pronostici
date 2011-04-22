class CreateBets < ActiveRecord::Migration
  def self.up
    create_table :bets do |t|
      t.integer :game_id
      t.integer :round_id
      t.integer :champion_id
      t.string :bid
      t.timestamps
    end
    add_index :bets, :game_id
    add_index :bets, :round_id
    add_index :bets, :champion_id
  end

  def self.down
    drop_table :bets
  end
end
