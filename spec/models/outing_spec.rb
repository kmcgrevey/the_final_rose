require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'relationships' do
    it {should have_many :contestant_outings}
    it {should have_many(:contestants).through(:contestant_outings)}
  end

  describe 'methods' do
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
    end
    
    it 'names_list' do
      expect(@out2.names_list).to include("Pilot Pete",
                                          "Diver Dan",
                                          "Hannah Brown")
    end

    it 'body_count' do
      expect(@out2.body_count).to eq(3)
    end
  end
end