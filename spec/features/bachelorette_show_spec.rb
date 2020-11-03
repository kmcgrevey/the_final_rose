require 'rails_helper'

RSpec.describe "When I visit bachelorette show page", type: :feature do
  before(:each) do
    @bach1 = Bachelorette.create!(name: "Hannah Brown",
                                 season_number: 15,
                                 season_desc: "The Most Dramatic Season Yet!")
    @bach2 = Bachelorette.create!(name: "Kate Capshaw",
                                 season_number: 10,
                                 season_desc: "Temple of Doom Season")

    visit "/bachelorettes/#{@bach1.id}"
  end
  
  it "I see that bachelorette's info" do
    expect(page).to have_content(@bach1.name)
    expect(page).to have_content(@bach1.season_number)
    expect(page).to have_content(@bach1.season_desc)
    expect(page).to_not have_content(@bach2.name)
  end

  it "I can click to see her contestants" do
    click_on "my contestants"

    expect(current_path).to eq("/bachelorettes/#{@bach1.id}/contestants")
    expect(page).to have_content("#{@bach1.name} contestants:")
    expect(page).to_not have_content(@bach2.name)
  end
end