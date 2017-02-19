class LoomsController < ApplicationController
  def index
    @looms= Loom.all
  end

  def new
    @loom= Loom.new

  end

  def create
    @loom=Loom.new(looms_params)
    if @loom.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @loom = Loom.find(params[:id])
  end

  def update
    @loom = Loom.find(params[:id])
    if @loom.update(looms_params)
      redirect_to looms_path
    else
      render 'edit'
    end
  end

  def destroy
    @loom = Loom.find(params[:id])
    @loom.destroy
    redirect_to looms_path
  end

  private
    def looms_params
      params.require(:loom).permit(:workshop,:reference)
    end
end
