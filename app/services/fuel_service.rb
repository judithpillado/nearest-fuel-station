class FuelService
  def self.closest_fuel_station(location)
    conn = Faraday.new('https://developer.nrel.gov')
    result = conn.get('/api/alt-fuel-stations/v1/nearest.json') do |req|
      req.params['location'] = location
      req.params['fuel_type'] = 'ELEC'
      req.params['limit'] = 1
      req.params['api_key'] = ENV['NREL_API']
    end
    JSON.parse(result.body, symbolize_names: true)
  end
end
