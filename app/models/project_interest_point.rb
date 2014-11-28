class ProjectInterestPoint < ActiveRecord::Base
  validates :content,    :presence => true
  validates :project_id, :presence => true

  belongs_to :project
end
