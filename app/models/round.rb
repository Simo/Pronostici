class Round < ActiveRecord::Base
  attr_accessible :champion_id, :nome_turno, :nome_breve, :leg_id, :data
  belongs_to :champion
  belongs_to :legs
  has_many :games
  
  def self.turni_attuali(campionato,oggi)
    where("champion_id = ? AND data > ?", campionato, oggi)
  end
end
