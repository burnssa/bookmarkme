class Topic < ActiveRecord::Base
  has_many :bookmarks
  belongs_to :user
end
