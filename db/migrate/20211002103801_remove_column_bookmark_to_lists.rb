class RemoveColumnBookmarkToLists < ActiveRecord::Migration[6.0]
  def change
    remove_column :lists, :bookmark_id
  end
end
