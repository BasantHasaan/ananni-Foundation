class JobOrdersController < ApplicationController
 def index
    @job_orders= JobOrder.all
  end

  def new
    @job_order= JobOrder.new

  end

  def create
    @job_order=JobOrder.new(job_orders_params)
    if @job_order.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @job_order = JobOrder.find(params[:id])
  end

  def update
    @job_order = JobOrder.find(params[:id])
    if @job_order.update(job_orders_params)
      redirect_to job_orders_path
    else
      render 'edit'
    end
  end

  def destroy
    @job_order = JobOrder.find(params[:id])
    @job_order.destroy
    redirect_to job_orders_path
  end

  private
    def job_orders_params
      params.require(:job_order).permit(:serial,:date,:item,:workshop,:loom,:worker)
    end
end
