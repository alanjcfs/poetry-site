class TweetedPoem < ActiveRecord::Base
  belongs_to :poem

  validates :poem_id, presence: true
end
