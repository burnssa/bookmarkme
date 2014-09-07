class AddIndexToBookmarks < ActiveRecord::Migration
  def change
    add_reference :bookmarks, :topic, index: true
  end
end
