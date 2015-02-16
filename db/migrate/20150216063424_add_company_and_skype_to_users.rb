class AddCompanyAndSkypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :company, :string
    add_column :users, :skype, :string
  end
end
