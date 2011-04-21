class ChampionsController < ApplicationController
  def index
    @champions = Champion.all
  end

  def show
    @champion = Champion.find(params[:id])
  end

  def new
    @champion = Champion.new
  end

  def create
    @champion = Champion.new(params[:champion])
    if @champion.save
      redirect_to @champion, :notice => "Successfully created champion."
    else
      render :action => 'new'
    end
  end

  def edit
    @champion = Champion.find(params[:id])
  end

  def update
    @champion = Champion.find(params[:id])
    if @champion.update_attributes(params[:champion])
      redirect_to @champion, :notice  => "Successfully updated champion."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @champion = Champion.find(params[:id])
    @champion.destroy
    redirect_to champions_url, :notice => "Successfully destroyed champion."
  end
end
