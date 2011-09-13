class CreateScores < ActiveRecord::Migration
  def self.up
    create_table :scores do |t|
      t.integer :user_id
      t.integer :champion_id
      t.float :points
      t.integer :last_round
      t.integer :times

      t.timestamps
    end
  end

  def self.down
    drop_table :scores
  end
end
