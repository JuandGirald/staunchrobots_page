class AddImageToCvs < ActiveRecord::Migration
  def change
    add_attachment :cvs, :avatar
  end
end
