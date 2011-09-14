class AddCheckedToBet < ActiveRecord::Migration
  def self.up
    add_column :bets, :checked, :boolean
  end

  def self.down
    remove_column :bets, :checked
  end
end
