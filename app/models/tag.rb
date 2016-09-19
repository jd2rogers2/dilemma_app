class Tag < ApplicationRecord
  validates :name, presence: true
  has_many :dilemma_tags
  has_many :dilemmas, through: :dilemma_tags

  def my_dilemmas
    array = []
    self.dilemmas.each do |d|
      array << d.name
    end
    array.join(", ")
  end
end
