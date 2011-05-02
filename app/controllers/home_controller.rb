class HomeController < ApplicationController
	
  def index  	
  	@campionati = Champion.order(:priority)
  	
  	if current_user
  		
  	else
  		redirect_to  new_user_session_path
  	end
  
  end
	
  def giornata
  	@giornata = Round.find(params[:trn])
  	@partite = Game.where(:round_id => params[:trn])
    @bets = Array.new(@partite.size)					#generiamo un array per contenere le scommesse da giocare per quel turno, per quel campionato
    @squadre_casa = Array.new(@partite.size)			#generiamo una serie di array per portarci dietro dati aggiuntivi delle partite
    @squadre_casa_sponsor = Array.new(@partite.size)
    @squadre_fuori = Array.new(@partite.size)
    @squadre_fuori_sponsor = Array.new(@partite.size)
  	
  	@j = 0
  	@i = 0
  	
  	
  	#carichiamo gli array per i vari loop all'interno delle schedine
  	
  	@partite.each do |p|
         @squadre_casa[@i]= p.home_team.nome
         @squadre_casa_sponsor[@i]= p.home_team.sponsor
         @squadre_fuori[@i]= p.away_team.nome
         @squadre_fuori_sponsor[@i]= p.away_team.sponsor
         @bets[@i] = Bet.new(:game_id => p.id, :round_id => p.round_id, :champion_id => p.round.champion_id)
         @i = @i + 1
	end
  	
  	respond_to do |format|
		format.html
		format.js {render :layout => false}
	end
	
  end
  
  def create_plus
    @bets = params[:bets].values.collect { |bet| Bet.new(bet) }
  	if @bets.each(&:save!)
  		flash[:notice] = "Pronostico inserito correttamente!"
 		redirect_to root_path
  	end	
  end
  
end
