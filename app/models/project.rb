class Project < ActiveRecord::Base
  # validates :name,  :presence => true
  # validates :cv_id, :presence => true

  belongs_to :cv
  has_many   :project_interest_points

  accepts_nested_attributes_for :project_interest_points, allow_destroy: true,
                                reject_if: :all_blank
end
