class SearchController < ApplicationController
  def index
    conn = Faraday.new('https://developer.nrel.gov')
    # Faraday.new should only be the protocol and the domain of what we're calling

    result = conn.get('/api/alt-fuel-stations/v1/nearest.json') do |req|
      # URI path
      req.params['location'] = params[:location]
      req.params['fuel_type'] = 'ELEC'
      req.params['limit'] = 1
      req.params['api_key'] = ENV['NREL_API']
    end
    @station = JSON.parse(result.body, symbolize_names: true)[:fuel_stations][0]
  end
end
