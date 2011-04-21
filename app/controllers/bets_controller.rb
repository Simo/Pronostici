class BetsController < ApplicationController
  def index
    @bets = Bet.all
  end

  def show
    @bet = Bet.find(params[:id])
  end

  def new
    @bet = Bet.new
  end

  def create
    @bet = Bet.new(params[:bet])
    if @bet.save
      redirect_to @bet, :notice => "Successfully created bet."
    else
      render :action => 'new'
    end
  end

  def edit
    @bet = Bet.find(params[:id])
  end

  def update
    @bet = Bet.find(params[:id])
    if @bet.update_attributes(params[:bet])
      redirect_to @bet, :notice  => "Successfully updated bet."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @bet = Bet.find(params[:id])
    @bet.destroy
    redirect_to bets_url, :notice => "Successfully destroyed bet."
  end
end
