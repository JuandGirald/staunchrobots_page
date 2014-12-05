class AddCvIdToLanguages < ActiveRecord::Migration
  def change
    add_column :languages, :cv_id, :integer
  end
end
