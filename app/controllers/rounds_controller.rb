class RoundsController < ApplicationController
  def index
    @rounds = Round.all
  end

  def show
    @round = Round.find(params[:id])
  end

  def new
    @round = Round.new
  end

  def create
    @round = Round.new(params[:round])
    if @round.save
      redirect_to @round, :notice => "Successfully created round."
    else
      render :action => 'new'
    end
  end

  def edit
    @round = Round.find(params[:id])
  end

  def update
    @round = Round.find(params[:id])
    if @round.update_attributes(params[:round])
      redirect_to @round, :notice  => "Successfully updated round."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @round = Round.find(params[:id])
    @round.destroy
    redirect_to rounds_url, :notice => "Successfully destroyed round."
  end
end
