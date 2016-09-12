class Tag < ApplicationRecord
  has_many :dilemma_tags
  has_many :dilemmas, through: :dilemma_tags
end
