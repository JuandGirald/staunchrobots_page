class AddReligiouslyFollowingToCvs < ActiveRecord::Migration
  def change
    add_column :cvs, :religiously_following, :text
  end
end
