require 'rails_helper'

RSpec.describe Station do
  it "creates a poro for fuel station" do
    attr = {
      station_name: 'ABC Inc.',
      street_address: '123 Main St',
      city: 'Denver',
      state: 'CO',
      zip: '80202',
      fuel_type: 'ELEC',
      access_times: 'Mon - Fri 24/7',
      distance: 'One stone throw',
      travel_time: 'Blink of an eye',
      directions: [
        'step 1',
        'step 2'
      ]
    }
    station = Station.new(attr)

    expect(station.name).to eq('ABC Inc.')
    expect(station.address).to eq('123 Main St., Denver, CO, 80202')
    expect(station.fuel_type).to eq('ELEC')
    expect(station.access_times).to eq('ELEC')
    expect(station.access_times).to eq('Mon - Fri 24/7')

    expect(station.distance).to eq('One stone throw')
    expect(station.travel_time).to eq('Blink of an eye')
    expect(station.directions).to be_an(Array)
    expect(station.directions[0]).to eq('step 1')
    expect(station.directions[1]).to eq('step 2')
  end
end
