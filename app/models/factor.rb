class Factor < ApplicationRecord
  validates :name, presence: true
  validates :points, presence: true, numericality: {message: "points entry must only be numbers"}
  belongs_to :option
end
