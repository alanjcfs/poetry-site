class Poem < ApplicationRecord
  has_many :tweeted_poems

  validates :johnson, uniqueness: true

  def to_s
    title
  end

end
