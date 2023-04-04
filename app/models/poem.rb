class Poem < ApplicationRecord
  has_many :tweeted_poems

  validates :johnson, uniqueness: true

  def to_s
    title
  end

  def self.ransackable_attributes(_auth_object = nil)
    %w[franklin johnson plain_text title]
  end

  def self.ransackable_associations(_auth_object=nil)
    []
  end
end
