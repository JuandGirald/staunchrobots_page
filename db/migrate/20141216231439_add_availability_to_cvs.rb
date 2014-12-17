class AddAvailabilityToCvs < ActiveRecord::Migration
  def change

    add_column :cvs, :availablity, :string, :default => 'Within 30 days'
  end
end
