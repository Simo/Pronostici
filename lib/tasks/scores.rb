def inserisci punteggi nelle scommesse
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

def calcola i punti
  @bets = Bet.where(bet.bid == bet.result)
  @bets.each do |bet|
    score = Score.where("user_id=? AND champion_id=?", bet.user_id, champion_id) ||= Score.new(:user_id => bet.user_id, :champion_id => bet.champion_id)
    if bet.bid == bet.result
      score.points += 1;
      score.times += 1;
      unless score.last_round == bet.round_id
        score.last_round = bet.round_id
     end
  end
end