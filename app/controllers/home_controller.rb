class HomeController < ApplicationController
  
  def index
  	@campionati = Champion.order(:priority)
  end
  
  def valuta
    
    # data
    oggi = Date.today
    ieri = Date.parse('2011-10-09')
    
    #parametri
    @campionato = params[:cmp]
    campionato = params[:cmp]
    
    #istanze
    giornata = Round.turni_attuali(campionato,oggi).first
    @giocate = Bet.giocate(giornata,current_user.id)
    
    #logica dietro al redirect
    if @giocate.blank?
      redirect_to :action => "giornata", :cmp => params[:cmp], :trn => giornata #:format => :js se l'utente non ha ancora inserito pronostici per la categoria/giornata va a "_giornata"
    else
      redirect_to :action => "valutato", :cmp => params[:cmp], :trn => giornata #:format => :js se l'utente ha già inserito pronostici va a "_valutato"
    end
    
  end
  
  def valutato
    
    # istanze
    camp = params[:cmp]
    oggi = Date.today
    gior = Round.turni_attuali(camp,oggi).first
    @giocate = Bet.giocate(gior,current_user.id)
    @giornata = Round.find(gior)
    @campionato = params[:cmp]
    @giocate = Bet.giocate(params[:trn],current_user.id)
    
    respond_to do |format|
        format.html
        format.js {render :layout => false}
    end
    
  end
	
  def giornata
    
    #inserisco la parte che era su valuta
    # data
    oggi = Date.today
    ieri = Date.parse('2011-10-09')
    
    #parametri
    @camp = params[:cmp]
    camp = params[:cmp]
    
    #istanze
    gior = Round.turni_attuali(camp,oggi).first
    @giocate = Bet.giocate(gior,current_user.id)
    @giornata = Round.find(gior)
    
    if @giocate.blank?
      # istanze
      @campionato = Champion.find(params[:cmp])
      #giornata = params[:trn]
    	@partite = Game.partite_turno(gior)
      @bets = Array.new(@partite.size)
      @squadre_casa = Array.new(@partite.size)
      @squadre_casa_sponsor = Array.new(@partite.size)
      @squadre_fuori = Array.new(@partite.size)
      @squadre_fuori_sponsor = Array.new(@partite.size)
      
      #counter
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
     else
       # istanze
        @campionato = params[:cmp]
        
        #@giocate = Bet.giocate(params[:trn],current_user.id)
        
        respond_to do |format|
            format.html { redirect_to :action => 'valutato', :cmp => params[:cmp], :trn => gior }
            format.js {render :layout => false}
        end
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
