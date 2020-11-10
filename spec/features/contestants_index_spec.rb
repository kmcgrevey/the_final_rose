require 'rails_helper'

RSpec.describe 'When on Contestants Index page as a visitor', type: :feature do
  it 'I see a UNIQUE list of their hometowns' do
    bach1 = Bachelorette.create!(name: "Hannah Brown",
                                 season_number: 15,
                                 season_desc: "The Most Dramatic Season Yet!")
    cont1 = Contestant.create!(name: "Pilot Pete",
                                age: 34,
                                hometown: "Irving, TX",
                                bachelorette_id: bach1.id)
    cont2 = Contestant.create!(name: "Diver Dan",
                                age: 43,
                                hometown: "Destin, FL",
                                bachelorette_id: bach1.id)
    cont3 = Contestant.create!(name: "Mover Mick",
                                age: 25,
                                hometown: "Destin, FL",
                                bachelorette_id: bach1.id)

    visit "/bachelorettes/#{bach1.id}/contestants"

    within("#hometowns") do
      expect(page).to have_content("Irving, TX")
      expect(page).to have_content("Destin, FL")
    end
  end
end