class SearchController < ApplicationController
  def index
    conn = Faraday.new('https://developer.nrel.gov')
    result = conn.get('/api/alt-fuel-stations/v1/nearest.json') do |req|
      req.params['location'] = params[:location]
      req.params['fuel_type'] = 'ELEC'
      req.params['limit'] = 1
      req.params['api_key'] = ENV['NREL_API']
    end
    nrel_data = JSON.parse(result.body, symbolize_names: true)
    @station = nrel_data[:fuel_stations][0]

    conn = Faraday.new('http://www.mapquestapi.com')
    result = conn.get('/directions/v2/route') do |req|
      req.params['key'] = ENV['MAPQUEST_API']
      req.params['from'] = "#{nrel_data[:latitude]},#{nrel_data[:longitude]}"
      req.params['to'] = "#{@station[:latitude]},#{@station[:longitude]}"
    end
    mapquest_data = JSON.parse(result.body, symbolize_names: true)[:route]
    dirs = []
    mapquest_data[:legs][0][:maneuvers].each do |maneuver|
      dirs << maneuver[:narrative]
    end
    @directions = {
      distance: mapquest_data[:distance],
      travel_time: mapquest_data[:formattedTime],
      directions: dirs
    }
  end
end
