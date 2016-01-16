class Poem < ActiveRecord::Base
  has_many :tweeted_poems

  validates :johnson, uniqueness: true

  def to_s
    title
  end

end
