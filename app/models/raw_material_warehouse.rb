class RawMaterialWarehouse < ApplicationRecord
	has_many :carpetmaterials
    has_many :carpet_data, through: :carpetmaterials
end
