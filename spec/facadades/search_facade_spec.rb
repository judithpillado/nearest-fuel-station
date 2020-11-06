require 'rails_helper'

RSpec.describe SearchFacade do
  describe 'class methods' do
    it '.fuel_station_search' do
      location = '1331 17th St LL100, Denver, CO 80202'
      result = SearchFacade.fuel_station_search(location)

      expect(result).to be_a(Station)
      expect(result.name).to eq('Seventeenth Street Plaza')
      expect(result.address).to eq('1225 17th St., Denver, CO, 80202')
      expect(result.fuel_type_code).to eq('ELEC')
      expect(result.access_days_time).to eq('MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified')
      expect(result.distance).to eq(0.141)
      expect(result.travel_time).to eq('00:01:04')
      expect(result.directions).to be_an(Array)
      expect(result.directions[0]).to eq('Start out going southeast on 17th St toward Larimer St/CO-33.')
    end
  end
end
