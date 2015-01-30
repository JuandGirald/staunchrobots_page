class AddSkillsToCvs < ActiveRecord::Migration
  def change
    add_column :cvs, :skills, :text
  end
end
