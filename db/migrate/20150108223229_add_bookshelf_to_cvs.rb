class AddBookshelfToCvs < ActiveRecord::Migration
  def change
    add_column :cvs, :bookshelf, :text
  end
end
