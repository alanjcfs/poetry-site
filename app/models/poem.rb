class Poem < ActiveRecord::Base
  attr_accessible :johnson, :text, :title

  validates :johnson, uniqueness: true
  
  def to_s
    title
  end
end
