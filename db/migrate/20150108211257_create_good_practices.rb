class CreateGoodPractices < ActiveRecord::Migration
  def change
    create_table :good_practices do |t|
      t.string :practice
      t.text :description

      t.timestamps
    end
  end
end
