class LegsController < ApplicationController
  def index
    @legs = Leg.all
  end

  def show
    @leg = Leg.find(params[:id])
  end

  def new
    @leg = Leg.new
  end

  def create
    @leg = Leg.new(params[:leg])
    if @leg.save
      redirect_to @leg, :notice => "Successfully created leg."
    else
      render :action => 'new'
    end
  end

  def edit
    @leg = Leg.find(params[:id])
  end

  def update
    @leg = Leg.find(params[:id])
    if @leg.update_attributes(params[:leg])
      redirect_to @leg, :notice  => "Successfully updated leg."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @leg = Leg.find(params[:id])
    @leg.destroy
    redirect_to legs_url, :notice => "Successfully destroyed leg."
  end
end
