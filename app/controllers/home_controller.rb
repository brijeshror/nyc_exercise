class HomeController < ApplicationController
  def index
    @years = EnergyUsage.group(:year).pluck(:year)
    year = params[:year] || @years.first
    @measurements = Measurement.order(:name)
    @energy_totals = EnergyUsage.where(year: year)
    @energy_usages = @energy_totals
                         .group(:building_id)
                         .includes([:building, :measurement])

  end
end
