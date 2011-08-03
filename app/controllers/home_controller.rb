class HomeController < ApplicationController
  
  def index
  	@campionati = Champion.order(:priority)
  end
	
  def giornata
    
    # data
    oggi = Date.today
    ieri = Date.parse('2011-07-21')
    
    # request parameters
    campionato = params[:cmp]
    turno = params[:trn]
    @campionato = params[:cmp]
    @turno = params[:trn]
    
    # istanze
    @giornata = Round.turni_attuali(campionato,ieri)
    giornata = @giornata[0].id
  	@partite = Game.where(:round_id => giornata)
    @bets = Array.new(@partite.size)
    @squadre_casa = Array.new(@partite.size)
    @squadre_casa_sponsor = Array.new(@partite.size)
    @squadre_fuori = Array.new(@partite.size)
    @squadre_fuori_sponsor = Array.new(@partite.size)
  	
  	j = 0
  	i = 0
  	
  	#con un loop tra le partite creo una scommessa ogni partita e registro i dati della partita
    #stessa su degli array a parte
  	@partite.each do |p|
         @squadre_casa[i]= p.home_team.nome
         @squadre_casa_sponsor[i]= p.home_team.sponsor
         @squadre_fuori[i]= p.away_team.nome
         @squadre_fuori_sponsor[i]= p.away_team.sponsor
         @bets[i] = Bet.new( :user_id => current_user.id, :game_id => p.id, :round_id => p.round_id, :champion_id => p.round.champion_id)
         i = i + 1
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
