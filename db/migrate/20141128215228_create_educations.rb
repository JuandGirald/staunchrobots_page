class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :title
      t.string :institution
      t.integer :cv_id

      t.timestamps
    end
  end
end
