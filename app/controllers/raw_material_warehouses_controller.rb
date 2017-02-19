class RawMaterialWarehousesController < ApplicationController
 def index
    @rawmaterials= RawMaterialWarehouse.all
  end

  def new
    @rawmaterial= RawMaterialWarehouse.new

  end

  def create
    @rawmaterial=RawMaterialWarehouse.new(rawmaterials_params)
    if @rawmaterial.save
      redirect_to(:action=>'index')#
    else
      render('new')
    end
  end

  def edit
    @rawmaterial = RawMaterialWarehouse.find(params[:id])
  end

  def update
    @rawmaterial = RawMaterialWarehouse.find(params[:id])
    if @rawmaterial.update(rawmaterials_params)
      redirect_to raw_material_warehouses_path
    else
      render 'edit'
    end
  end

  def destroy
    @rawmaterial = RawMaterialWarehouse.find(params[:id])
    @rawmaterial.destroy
    redirect_to raw_material_warehouses_path
  end

  private
    def rawmaterials_params
      params.require(:raw_material_warehouse).permit(:code,:item,:description,:uom,:safety_level,:category)
    end
end
