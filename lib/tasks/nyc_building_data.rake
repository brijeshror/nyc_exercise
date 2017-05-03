namespace :nyc_building do
  desc 'Fetch building data from NYC'
  task :data => :environment do
    url = 'https://data.cityofnewyork.us/resource/dnpn-ts5d.json'
    api_response = HTTParty.get(url)
    json_response = JSON.parse(api_response.body)
    if api_response.code == 200
      json_response.reject!(&:empty?).each do |data|
        ap building_name = data['location_1_location']
        ap measurement_name = data['measurement']
        building = Building.find_or_create_by(name: building_name)
        measurement = Measurement.find_or_create_by(name: measurement_name)
        yearwise = {}
        Date::ABBR_MONTHNAMES.compact.map(&:downcase).each do |month|
          data.each do |key, value|
            if key.include?(month)
              year = "20" + key.gsub("#{month}_", '')
              yearwise[year] ||= {}
              yearwise[year][month] = value
            end
          end
        end
        yearwise.sort.map do |year, values_hash|
          energy_usage = EnergyUsage.find_or_initialize_by(building: building, measurement: measurement, year: year)
          energy_usage.attributes = values_hash
          energy_usage.total = values_hash.values.map(&:to_f).sum
          energy_usage.save
        end
      end
    end
  end
end