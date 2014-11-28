class Project < ActiveRecord::Base
  validates :name,  :presence => true
  validates :cv_id, :presence => true

  belongs_to :cv
  has_many   :project_interest_points
end
