require 'rails_helper'

RSpec.describe "As visitor on Outing's show page", type: :feature do
  before(:each) do
    @bach1 = Bachelorette.create!(name: "Hannah Brown",
                                 season_number: 15,
                                 season_desc: "The Most Dramatic Season Yet!")
    @cont1 = Contestant.create!(name: "Pilot Pete",
                                age: 34,
                                hometown: "Irving, TX",
                                bachelorette_id: @bach1.id)
    @cont2 = Contestant.create!(name: "Diver Dan",
                                age: 43,
                                hometown: "Destin, FL",
                                bachelorette_id: @bach1.id)
    @out1 = Outing.create!(name: "Kickball",
                           location: "Detroit",
                           date: "01/02/20")
    @out2 = Outing.create!(name: "Helicopter Ride",
                           location: "Bali",
                           date: "09/12/19")
    ContestantOuting.create!(contestant_id: @cont1.id,
                             outing_id: @out2.id)
    ContestantOuting.create!(contestant_id: @cont2.id,
                             outing_id: @out2.id)

    visit "/outings/#{@out2.id}"
  end
  
  it "I see that outings name, location, and date" do
    expect(page).to have_content(@out2.name)
    expect(page).to_not have_content(@out1.name)
    expect(page).to have_content(@out2.location)
    expect(page).to have_content(@out2.date)
  end

  it "I see a total count and name list of contestatnts on Outing" do
    expect(page).to have_content("Count of Contestants: 3")
    expect(page).to have_content("Hannah Brown")
    expect(page).to have_content("Pilot Pete")
    expect(page).to have_content("Diver Dan")
  end
end