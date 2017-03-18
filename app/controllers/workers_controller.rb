class WorkersController < ApplicationController
    def index
    @workers= Worker.all
  end

  def new
    @worker= Worker.new

  end

  def create
    @worker=Worker.new(workers_params)
    if @worker.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update(workers_params)
      redirect_to workers_path
    else
      render 'edit'
    end
  end

  def destroy
    @worker = Worker.find(params[:id])
    @worker.destroy
    redirect_to workers_path
  end

  private
    def workers_params
      params.require(:worker).permit(:code,:name,:address,:phone,:category,:rate_unit,:rate_amount,:fired,:firing_date)
    end
end
