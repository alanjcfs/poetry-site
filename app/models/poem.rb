class Poem < ActiveRecord::Base
  attr_accessible :johnson, :text

  validates :johnson, uniqueness: true
end
