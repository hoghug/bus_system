class ArrivalsController < ApplicationController
  def index
    @arrivals = Arrival.all
  end

  def create
    @arrival_times = params[:arrival_times]
    {26 => '12:50', 26 => "1:30"}
    @arrival_times.each do |id,at|
      Arrival.create({:time => at, :stop_id => id, :bus_id => params[:bus_id]})
    end
    render :root
  end

  private
    def arrival_params
      params.require(:arrival).permit(:bus_id, :arrival_times)
    end


end
