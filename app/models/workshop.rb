class Workshop < ApplicationRecord
	has_many :looms
	belongs_to :location
end
