class AddCvTypeToCvs < ActiveRecord::Migration
  def change
    add_column :cvs, :cv_type, :string, default: "public"
  end
end
