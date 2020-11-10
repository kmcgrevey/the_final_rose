class Outing < ApplicationRecord
  has_many :contestant_outings
  has_many :contestants, through: :contestant_outings

  def names_list
    list = contestants +
          (contestants.map { |cont| cont.bachelorette }).uniq
    list.map { |person| person.name }
  end

  def body_count
    names_list.count
  end
end