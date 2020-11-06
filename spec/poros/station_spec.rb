require 'rails_helper'

RSpec.describe Station do
  it "creates a poro for fuel station" do
    attr = {
      station_name: 'ABC Inc.',
      street_address: '123 Main St',
      city: 'Denver',
      state: 'CO',
      zip: '80202',
      fuel_type_code: 'ELEC',
      access_days_time: 'Mon - Fri 24/7',
      distance: 23.4,
      travel_time: '00:20:09',
      directions: [
        'step 1',
        'step 2'
      ]
    }
    station = Station.new(attr)

    expect(station.name).to eq('ABC Inc.')
    expect(station.address).to eq('123 Main St, Denver, CO, 80202')
    expect(station.fuel_type_code).to eq('ELEC')
    expect(station.access_days_time).to eq('Mon - Fri 24/7')

    expect(station.distance).to eq(23.4)
    expect(station.travel_time).to eq('00:20:09')
    expect(station.directions).to be_an(Array)
    expect(station.directions[0]).to eq('step 1')
    expect(station.directions[1]).to eq('step 2')
  end
end
