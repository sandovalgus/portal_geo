class Zone < ApplicationRecord
	has_many :coordinate_zones
	has_many :customers
end
