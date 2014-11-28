class CreateProjectInterestPoints < ActiveRecord::Migration
  def change
    create_table :project_interest_points do |t|
      t.string :content
      t.integer :project_id

      t.timestamps
    end
  end
end
