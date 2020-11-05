require 'rails_helper'

RSpec.describe 'Find Nearest Station' do
  it 'displays the closest electric fuel station to me' do
    visit root_path
    select 'Turing', from: :location
    click_button('Find Nearest Station')
    expect(current_path).to eq(search_path)

    expect(page).to have_content('Closest Electric Fuel Station to You')
    expect(page).to have_content('Name: Seventeenth Street Plaza')
    expect(page).to have_content('Address: 1225 17th St., Denver, CO, 80202')
    expect(page).to have_content('Fuel Type: ELEC')
    expect(page).to have_content('Access Times: MO: Not Specified; TU: Not Specified; WE: Not Specified; TH: Not Specified; FR: Not Specified; SA: Not Specified; SU: Not Specified')
    expect(page).to have_content('Distance of Nearest Station: 0.1 miles')
    expect(page).to have_content('Travel Time: 1 minute')
    expect(page).to have_content('Direction Instructions: Turn left onto Lawrence St Destination will be on the left')
  end
end

# As a user
# When I visit "/"
# And I select "Turing" form the start location drop down (Note: Use the existing search form)
# And I click "Find Nearest Station"
# Then I should be on page "/search"
# Then I should see the closest electric fuel station to me.
# For that station I should see
# - Name
# - Address
# - Fuel Type
# - Access Times
# I should also see:
# - the distance of the nearest station (should be 0.1 miles)
# - the travel time from Turing to that fuel station (should be 1 min)
# - The direction instructions to get to that fuel station
#   "Turn left onto Lawrence St Destination will be on the left"
