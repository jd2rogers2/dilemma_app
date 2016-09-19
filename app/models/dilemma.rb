class Dilemma < ApplicationRecord
  validates :name, presence: true
  validates :deadline, presence: true
  belongs_to :user
  has_many :options
  has_many :factors, through: :options
  has_many :dilemma_tags
  has_many :tags, through: :dilemma_tags
  before_destroy :destroy_options

  def tags_attributes=(tag_hash)
    binding.pry
    tag_hash.each do |num_key, hash|
      if hash[:name] != ""
      else
      end
    end
  end

  # def factors_attributes=(factor_hash)
  #   factor_hash.each do |num_key, hash|
  #     if hash[:name] != "" && hash[:points] != ""
  #       if self.factors.include?(Factor.find_by(id: hash[:id]))
  #         factor = Factor.find_by(id: hash[:id])
  #         factor.update(name: hash[:name], points: hash[:points])
  #         factor.save
  #       else
  #         new_fact = Factor.create(hash)
  #         self.factors << new_fact
  #         self.save
  #       end
  #     end
  #   end
  # end

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
