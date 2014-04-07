class LinesController < ApplicationController
  def index
    @line = Line.new
    @lines = Line.all

  end

  def show
    @line = Line.find(params[:id])
    @buses = @line.buses
    @bus = Bus.new
  end

  def create
    @line = Line.new(line_params)
    if @line.save
      flash[:notice] = "Line created."
      redirect_to lines_path
    else
      @lines = Line.all
      render 'index'
    end
  end

  def update
    @line = Line.find(params[:id])
    if @line.update(line_params)
      flash[:notice] = "Line updated."
      redirect_to line_path
    else
      render 'show'
    end
  end

  def destroy
    @line = Line.find(params[:id])
    @line.destroy
    flash[:notice] = "The line '#{@line.name}' was deleted."
    redirect_to lines_path
  end

  private
    def line_params
      params.require(:line).permit(:name)
    end

end
