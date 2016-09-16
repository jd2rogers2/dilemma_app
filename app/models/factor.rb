class Factor < ApplicationRecord
  validates :name, presence: true
  validates :points, presence: true
  belongs_to :option
end
