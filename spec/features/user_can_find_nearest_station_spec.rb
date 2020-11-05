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
    expect(page).to have_content('Distance of Nearest Station: 0.141 miles')
    expect(page).to have_content('Travel Time: 00:01:04')
    expect(page).to have_content('Start out going southeast on 17th St toward Larimer St/CO-33.')
  end
end
