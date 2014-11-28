class Education < ActiveRecord::Base
  validates :title,       :presence => true
  validates :institution, :presence => true
  validates :cv_id,       :presence => true

  belongs_to :cv
end
