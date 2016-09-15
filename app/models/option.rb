class Option < ApplicationRecord
  belongs_to :dilemma
  has_many :factors
  accepts_nested_attributes_for :factors

  def factors_attributes=(factor_hash)
    @factor = self.factors.create(factor_hash["0"])
    @factor.option = self
    @factor.save
    # getting error because parent is not saved
  end

  def total_points
    sum = 0
    self.factors.each do |f|
      sum += f.points
    end
    sum
  end
end
