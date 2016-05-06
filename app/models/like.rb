class Like < ActiveRecord::Base
  # join table between users (likers) and talks (liked_talks)
  belongs_to :talk
  belongs_to :user
end
