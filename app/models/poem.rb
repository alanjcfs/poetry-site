class Poem < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection

  validates :johnson, uniqueness: true

  def to_s
    title
  end
end
