class AddTechStackToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :tech_stack, :text
  end
end
