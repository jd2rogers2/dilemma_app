class Dilemma < ApplicationRecord
  belongs_to :user
  has_many :options
  has_many :factors, through: :options
  has_many :dilemma_tags
  has_many :tags, through: :dilemma_tags

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

  # def pretty_deadline
  #   self.deadline.strftime("%A, %d %b %Y")
  # end
end
