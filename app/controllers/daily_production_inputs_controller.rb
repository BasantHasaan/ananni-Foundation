class DailyProductionInputsController < ApplicationController
	def index
    @dailyproductions= DailyProductionInput.all
  end

  def new
    @dailyproduction= DailyProductionInput.new

  end

  def create
    @dailyproduction=DailyProductionInput.new(dailyproductions_params)
    if @dailyproduction.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @dailyproduction = DailyProductionInput.find(params[:id])
  end

  def update
    @dailyproduction = DailyProductionInput.find(params[:id])
    if @dailyproduction.update(dailyproductions_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @dailyproduction = DailyProductionInput.find(params[:id])
    @dailyproduction.destroy
    redirect_to categories_path
  end

  private
    def dailyproductions_params
      params.require(:dailyproductions).permit(:serial,:date,:number_of_row)
    end
end


