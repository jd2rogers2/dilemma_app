class Dilemma < ApplicationRecord
  validates :name, presence: true
  validates :deadline, presence: true
  belongs_to :user
  has_many :options
  has_many :factors, through: :options
  has_many :dilemma_tags
  has_many :tags, through: :dilemma_tags
  before_destroy :destroy_options

  def tag_attributes=(hash)
    binding.pry
  end

  def best_option
    has_most_points = nil
    self.options.each do |opt|
      if has_most_points == nil
        has_most_points = opt
      elsif opt.total_points > has_most_points.total_points
        has_most_points = opt
      end 
    end
    has_most_points.name
  end

  def overdue?
    self.deadline < Time.now ? true : false
  end

  def pretty_deadline
    self.deadline.strftime("%A, %d %b %Y")
  end

  def destroy_options
    self.options.each do |o|
      o.destroy
    end
  end

  def my_tags
    array = []
    self.tags.each do |t|
      array << t.name
    end
    array.join(", ")
  end
end
