class Bachelorette <ApplicationRecord
  has_many :contestants

  def avg_cont_age
    contestants.average(:age)
  end

  def cont_hometowns
    contestants.pluck(:hometown).uniq
  end
  
end
