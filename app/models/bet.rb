class Bet < ActiveRecord::Base
  attr_accessible :game_id, :round_id, :champion_id, :user_id, :bid
  belongs_to :game
  belongs_to :round
  belongs_to :champion
  belongs_to :user
end
