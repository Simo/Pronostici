class AddResultToBet < ActiveRecord::Migration
  def self.up
    add_column :bets, :result, :string
  end

  def self.down
    remove_column :bets, :result
  end
end
