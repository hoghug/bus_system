class BusesController < ApplicationController
  def index
    @buses = Bus.all
  end

  def show
    @bus = Bus.find(params[:id])
  end

  def edit
    @bus = Bus.find(params[:id])
  end

  def create
    @line = Line.find(params[:line_id])
    @bus = @line.buses.new(bus_params)
    if @bus.save
      flash[:notice] = "#{@bus.name} has been added"
      redirect_to line_path(@line)
    else
      render 'lines/show.html.erb'
    end
  end

  private
    def bus_params
      params.require(:bus).permit(:name, :line_id)
    end

end
