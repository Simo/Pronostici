# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Champion.delete_all
open("/Users/sbierti/Progetti/rails/Pronostici/db/data/champions_seed.csv") do |champions|  
  champions.read.each_line do |champion|  
    nome_campionato, priority, ambito = champion.chomp.split(";")  
    Champion.create!( :nome_campionato => nome_campionato, :priority => priority, :ambito => ambito )  
  end  
end


Game.delete_all
open("/Users/sbierti/Progetti/rails/Pronostici/db/data/games_seed.csv") do |games|  
  games.read.each_line do |game|  
    round_id, codfip, team_home_id, team_away_id = game.chomp.split(";")  
    Game.create!(:round_id => round_id, :home_team_id => team_home_id, :away_team_id => team_away_id, :codfip => codfip )  
  end  
end

Round.delete_all
open("/Users/sbierti/Progetti/rails/Pronostici/db/data/rounds_seed.csv") do |rounds|
  rounds.read.each_line do |round|
    champion_id, nome_turno, nome_breve, leg_id, data = round.chomp.split(";")
    Round.create!(:champion_id => champion_id, :nome_turno => nome_turno, :nome_breve => nome_breve, :leg_id => leg_id, :data => data)
  end
end

Team.delete_all
open("/Users/sbierti/Progetti/rails/Pronostici/db/data/teams_seed.csv") do |teams|
  teams.read.each_line do |team|
    nome, sponsor = team.chomp.split(";")
    Team.create!(:nome => nome, :sponsor => sponsor)
  end
end