require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
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
    end

    it 'avg_cont_age' do
      expect(@bach1.avg_cont_age).to eq(38.5)
    end
  end
end
