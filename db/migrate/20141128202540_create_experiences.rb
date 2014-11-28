class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :name
      t.integer :years
      t.integer :cv_id

      t.timestamps
    end
  end
end
