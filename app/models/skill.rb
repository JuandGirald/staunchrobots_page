class Skill < ActiveRecord::Base
  validates :name,  :presence => true
  validates :cv_id, :presence => true

  belongs_to :cv
end
