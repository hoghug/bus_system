class StopsController < ApplicationController


  def new
    @stop = Stop.new
    @lines = Line.all
    @stations = Station.all
  end

  def create
    @stop = Stop.new(stop_params)
    if @stop.save
      flash[:notice] = "Stop created."
      redirect_to :root
    else
      render 'new'
    end
  end

  def destroy
    @stop = Stop.find(params[:id])
    @stop.destroy
    redirect_to line_path(@stop.line)
  end

  private
    def stop_params
      params.require(:stop).permit(:station_id, :line_id)
    end

end
