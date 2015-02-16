class AddPhoneAndCommentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string
    add_column :users, :comments, :text
  end
end
