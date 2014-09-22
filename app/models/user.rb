class User < ActiveRecord::Base
  has_many :bookmarks
  has_many :likes, dependent: :destroy 

  has_secure_password
  validates_uniqueness_of :email

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
end