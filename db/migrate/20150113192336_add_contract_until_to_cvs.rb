class AddContractUntilToCvs < ActiveRecord::Migration
  def change
    add_column :cvs, :contract_until, :date
  end
end
