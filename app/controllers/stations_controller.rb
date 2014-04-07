class StationsController < ApplicationController
  def index
    @station = Station.new
    @stations = Station.all
  end

  def show
    @station = Station.find(params[:id])
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      flash[:notice] = "Station created."
      redirect_to stations_path
    else
      @stations = Station.all
      render 'index'
    end
  end

  def update
    @station = Station.find(params[:id])
    if @station.update(station_params)
      flash[:notice] = "Station updated."
      redirect_to station_path
    else
      render 'show'
    end
  end

  def destroy
    @station = Station.find(params[:id])
    @station.destroy
    flash[:notice] = "The station '#{@station.name}' was deleted."
    redirect_to stations_path
  end

  private
    def station_params
      params.require(:station).permit(:name)
    end

end
