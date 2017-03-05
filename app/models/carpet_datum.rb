class CarpetDatum < ApplicationRecord
	has_many :carpetmaterials
	has_many :raw_material_warehouses, through: :carpetmaterials
end
