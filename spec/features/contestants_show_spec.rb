require 'rails_helper'

RSpec.describe "When I visit contestant show page", type: :feature do
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
    
    visit "/bachelorettes/#{@bach1.id}/contestants"
  end

  it "I see contestant's info" do
    expect(page).to have_content(@cont1.name)
    expect(page).to have_content(@cont1.age)
    expect(page).to have_content(@cont1.hometown)
    
    expect(page).to have_content(@cont2.name)
    expect(page).to have_content(@cont2.age)
    expect(page).to have_content(@cont2.hometown)

    click_on @cont1.name
    expect(current_path).to eq("/contestants/#{@cont1.id}")
  end
 
end
  