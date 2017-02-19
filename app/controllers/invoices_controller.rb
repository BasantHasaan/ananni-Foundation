class InvoicesController < ApplicationController
  def index
    @invoices= Invoice.all
  end

  def new
    @invoice= Invoice.new

  end

  def create
    @invoice=Invoice.new(invoices_params)
    if @invoice.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
    if @invoice.update(invoices_params)
      redirect_to invoices_path
    else
      render 'edit'
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id])
    @invoice.destroy
    redirect_to invoices_path
  end

  private
    def invoices_params
      params.require(:invoice).permit(:name,:location,:address,:person_name,:person_number)
    end
end
