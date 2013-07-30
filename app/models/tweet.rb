class Tweet < ActiveRecord::Base
	validate :text, :uniqueness => true
	validate :twitter_id, :uniqueness => true
	validate :user_id, :uniqueness => true

  belongs_to :user
end
