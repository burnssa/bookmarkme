class AddAttachmentThumbnailToBookmarks < ActiveRecord::Migration
  def self.up
    change_table :bookmarks do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :bookmarks, :thumbnail
  end
end
