class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.integer :champion_id
      t.string :nome_turno
      t.string :nome_breve
      t.integer :leg_id
      t.date :data
      t.timestamps
    end
  end

  def self.down
    drop_table :rounds
  end
end
