class Champion < ActiveRecord::Base
  attr_accessible :nome_campionato, :priority, :ambito
  has_many :rounds
  has_many :scores
  has_many :users, :through => :scores
end
