class TweetedPoem < ApplicationRecord
  belongs_to :poem

  validates :poem, presence: true
end
