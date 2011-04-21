class Champion < ActiveRecord::Base
  attr_accessible :nome_campionato, :priority, :ambito
  has_many :rounds
end
