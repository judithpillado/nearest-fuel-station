class MapquestService
  def self.driving_directions(latitude1, longitude1, latitude2, longitude2)
    conn = Faraday.new('http://www.mapquestapi.com')
    result = conn.get('/directions/v2/route') do |req|
      req.params['key'] = ENV['MAPQUEST_API']
      req.params['from'] = "#{latitude1},#{longitude1}"
      req.params['to'] = "#{latitude2},#{longitude2}"
    end
    JSON.parse(result.body, symbolize_names: true)[:route]
  end
end
