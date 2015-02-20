class AddMonthlyDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :monthly_digest, :string, default: "1"
  end
end
