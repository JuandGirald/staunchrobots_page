class ChangeGithubUrlFormatInCodeSamples < ActiveRecord::Migration
  def up
   change_column :code_samples, :github_url, :string
  end

  def down
   change_column :code_samples, :github_url, :integer
  end
end
