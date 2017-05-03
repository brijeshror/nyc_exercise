module HomeHelper
  def get_totals(energy_usage, measurement)
    energy_data = @energy_totals.find{|energy| energy.building_id == energy_usage.building_id && energy.measurement_id == measurement.id}
    (energy_data.try(:total).to_f)
  end
end
