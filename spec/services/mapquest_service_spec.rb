require 'rails_helper'

RSpec.describe MapquestService do
  describe 'class methods' do
    it 'driving_directions' do

      latitude1 = 39.750614
      longitude1 = -104.996775

      latitude2 = 39.7501605
      longitude2 = -104.9951224

      route = MapquestService.driving_directions(latitude1, longitude1, latitude2, longitude2)

      expect(route).to have_key :distance
      expect(route[:distance]).to be_a(Float)

      expect(route).to have_key :formattedTime
      expect(route[:formattedTime]).to be_a(String)

      expect(route).to have_key :legs
      expect(route[:legs]).to be_an(Array)

      first_leg = route[:legs][0]

      expect(first_leg).to have_key :maneuvers
      expect(first_leg[:maneuvers]).to be_an(Array)

      maneuvers = first_leg[:maneuvers]
      expect(maneuvers.length).to eq(3)

      expect(maneuvers[0]).to have_key :narrative
      expect(maneuvers[0][:narrative]).to be_a(String)
    end
  end
end
