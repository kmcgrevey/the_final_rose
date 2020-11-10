class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  def names_list
    contestants.pluck(:name) +
    Bachelorette.find(contestants.pluck(:bachelorette_id).uniq)
                .pluck(:name)
  end

  def body_count
    names_list.count
  end
end