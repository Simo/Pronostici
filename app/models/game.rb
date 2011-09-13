class Game < ActiveRecord::Base
  attr_accessible :round_id, :home_team_id, :away_team_id, :codfip, :result
  belongs_to :round
  belongs_to :home_team, :class_name => 'Team', :foreign_key => 'home_team_id'
  belongs_to :away_team, :class_name => 'Team', :foreign_key => 'away_team_id'
  has_many :bets
  
  def self.partite_turno(giornata)
    where(:round_id => giornata)
  end
  
end
