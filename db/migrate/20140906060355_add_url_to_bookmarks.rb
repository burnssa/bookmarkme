class AddUrlToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :url, :string
    add_column :bookmarks, :liked, :boolean
    add_reference :bookmarks, :user, index: true
  end
end
