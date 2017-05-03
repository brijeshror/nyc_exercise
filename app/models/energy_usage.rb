class EnergyUsage < ApplicationRecord
  belongs_to :building
  belongs_to :measurement
end
