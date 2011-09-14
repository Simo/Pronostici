class Score < ActiveRecord::Base
  attr_accessible :user_id, :champion_id, :points, :last_round, :times
  belongs_to :user
  belongs_to :champion
end
