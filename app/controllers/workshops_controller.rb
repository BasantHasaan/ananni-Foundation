class WorkshopsController < ApplicationController
  def index
    @workshops= Workshop.all
    @location=Location.all.map{|u| [u.name]}

  end

  def new
    @location_options = Location.all.map{ |u| [ u.name, u.id ] }
    @workshop= Workshop.new

  end

  def create
    @workshop=Workshop.new(workshops_params)
    if @workshop.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @location_options = Workshop.all.map{ |u| [ u.name, u.id ] }
    @workshop = Workshop.find(params[:id])
  end

  def update
    @workshop = Workshop.find(params[:id])
    if @workshop.update(workshops_params)
      redirect_to workshops_path
    else
      render 'edit'
    end
  end

  def destroy
    @workshop = Workshop.find(params[:id])
    @workshop.destroy
    redirect_to workshops_path
  end

  private
    def workshops_params
      params.require(:workshop).permit(:name,:location_id)
    end
end
