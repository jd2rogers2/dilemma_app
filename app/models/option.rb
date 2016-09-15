class Option < ApplicationRecord
  belongs_to :dilemma
  has_many :factors
  before_destroy :destroy_factors

  def factors_attributes=(factor_hash)
    factor_hash.each do |num_key, hash|
      if hash[:name] != "" && hash[:points] != ""
        new_fact = Factor.create(hash)
        self.factors << new_fact
        self.save
      end
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
