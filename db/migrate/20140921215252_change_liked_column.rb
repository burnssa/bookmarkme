class ChangeLikedColumn < ActiveRecord::Migration
  def up
  	change_column :bookmarks, :liked, :boolean, default: false
	end

	def down
  	change_column :bookmarks, :liked, :boolean, default: true
	end
end
