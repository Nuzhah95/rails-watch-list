class AddForeignKeyToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookmarks, :list
    add_reference :bookmarks, :movie
  end
end
