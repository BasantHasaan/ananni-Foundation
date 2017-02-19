class DailyProductionInputController < ApplicationController
  def index
    @dailyproductions= Category.all
  end

  def new
    @dailyproduction= Category.new

  end

  def create
    @dailyproduction=Category.new(dailyproductions_params)
    if @dailyproduction.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @dailyproduction = Category.find(params[:id])
  end

  def update
    @dailyproduction = Category.find(params[:id])
    if @dailyproduction.update(dailyproductions_params)
      redirect_to categories_path
    else
      render 'edit'
    end
  end

  def destroy
    @dailyproduction = Category.find(params[:id])
    @dailyproduction.destroy
    redirect_to categories_path
  end

  private
    def dailyproductions_params
      params.require(:dailyproduction).permit(:name)
    end
end
