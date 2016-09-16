class Option < ApplicationRecord
  validates :name, presence: true
  belongs_to :dilemma
  has_many :factors
  before_destroy :destroy_factors

  def factors_attributes=(factor_hash)
    # currently adding new instead of updating
    factor_names = self.factors.collect{|f| f.name}
    factor_hash.each do |num_key, hash|
      if hash[:name] != "" && hash[:points] != "" && !factor_names.include?(hash[:name])
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
