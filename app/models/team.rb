class Team < ActiveRecord::Base
  attr_accessible :nome, :sponsor
  has_many :games
end
