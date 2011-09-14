namespace :graduatoria do

task :valuta => :environment do 
  @rounds = Round.where(turni che si sono giocati)
  @rounds.each do |round|
    @games = Game.where(:round_id => round.id)
    @games.each do |game|
      @bets = Bet.find(:game_id => game.id)
      @bets.each do |bet|
        bet.result = game.result
        bet.save
      end
    end
  end
end

task :calcola => :environment do
  @bets = Bet.where("bid = result AND checked is null")
  @bets.each do |bet|
    score = Score.where("user_id=? AND champion_id=?", bet.user_id, bet.champion_id).all
    if score.count == 0
      score = Score.create!(:user_id => bet.user_id, :champion_id => bet.champion_id, :points => 0, :times => 0, :last_round => 0)
      score.points += 1
      score.times += 1   
      unless score.last_round == bet.round_id
        score.last_round = bet.round_id
      end
     score.save!
   else
     score = score.first
     score.points += 1
     score.times += 1   
     unless score.last_round == bet.round_id
       score.last_round = bet.round_id
     end
    score.save!
   end
  end
end

end