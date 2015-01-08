class AddCvIdToGoodPractices < ActiveRecord::Migration
  def change
    add_column :good_practices, :cv_id, :integer
  end
end
