class Option < ApplicationRecord
  belongs_to :dilemma
  has_many :factors

  def total_points
    sum = 0
    self.factors.each do |f|
      sum += f.points
    end
    sum
  end
end
