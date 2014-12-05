class CreateCodeSamples < ActiveRecord::Migration
  def change
    create_table :code_samples do |t|
      t.string :name
      t.integer :github_url
      t.integer :cv_id

      t.timestamps
    end
  end
end
