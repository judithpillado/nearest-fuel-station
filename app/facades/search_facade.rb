class SearchFacade
  def self.fuel_station_search(location)
    nrel_data = FuelService.closest_fuel_station(location)
    station_attr = nrel_data[:fuel_stations][0]
    mapquest_data = MapquestService.driving_directions(
      nrel_data[:latitude],
      nrel_data[:longitude],
      station_attr[:latitude],
      station_attr[:longitude]
    )
    dirs = []
    mapquest_data[:legs][0][:maneuvers].each do |maneuver|
      dirs << maneuver[:narrative]
    end

    attr = {
      station_name: station_attr[:station_name],
      street_address: station_attr[:street_address],
      city: station_attr[:city],
      state: station_attr[:state],
      zip: station_attr[:zip],
      fuel_type_code: station_attr[:fuel_type_code],
      access_days_time: station_attr[:access_days_time],

      distance: mapquest_data[:distance],
      travel_time: mapquest_data[:formattedTime],
      directions: dirs
    }
    Station.new(attr)
  end
end
