class SearchFacade
  def self.fuel_station_search(location)

    conn = Faraday.new('https://developer.nrel.gov')
    result = conn.get('/api/alt-fuel-stations/v1/nearest.json') do |req|
      req.params['location'] = location
      req.params['fuel_type'] = 'ELEC'
      req.params['limit'] = 1
      req.params['api_key'] = ENV['NREL_API']
    end
    nrel_data = JSON.parse(result.body, symbolize_names: true)
    station_attr = nrel_data[:fuel_stations][0]

    conn = Faraday.new('http://www.mapquestapi.com')
    result = conn.get('/directions/v2/route') do |req|
      req.params['key'] = ENV['MAPQUEST_API']
      req.params['from'] = "#{nrel_data[:latitude]},#{nrel_data[:longitude]}"
      req.params['to'] = "#{station_attr[:latitude]},#{station_attr[:longitude]}"
    end
    mapquest_data = JSON.parse(result.body, symbolize_names: true)[:route]
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
