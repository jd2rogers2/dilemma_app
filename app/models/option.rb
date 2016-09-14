class Option < ApplicationRecord
  belongs_to :dilemma
  has_many :factors
  accepts_nested_attributes_for :factors

  def factor_attributes=(factor_hash)
    self.save
    @factor = self.factors.create(factor_hash.first)
    @factor.option = self
    @factor.save
  end

  def total_points
    sum = 0
    self.factors.each do |f|
      sum += f.points
    end
    sum
  end
end
