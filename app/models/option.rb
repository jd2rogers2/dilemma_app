class Option < ApplicationRecord
  belongs_to :dilemma
  has_many :factors
  before_destroy :destroy_factors

  def factors_attributes=(factor_hash)
    if factor_hash["0"][:name] != ""
      new_fact = Factor.create(factor_hash["0"])
      self.factors << new_fact
      self.save
    end
  end

  def total_points
    sum = 0
    self.factors.each do |f|
      sum += f.points
    end
    sum
  end

  def destroy_factors
    self.factors.each do |f|
      f.destroy
    end
  end
end
