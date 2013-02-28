class Poem < ActiveRecord::Base
  attr_accessible :johnson, :text

  validates :johnson, uniqueness: true
  
  def to_s
    title
  end
end
