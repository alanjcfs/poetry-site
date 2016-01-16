class TweetedPoem < ActiveRecord::Base
  belongs_to :poem

  validates :poem, presence: true
end
