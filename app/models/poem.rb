class Poem < ActiveRecord::Base

  validates :johnson, uniqueness: true

  def to_s
    title
  end

end
