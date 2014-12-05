class Cv < ActiveRecord::Base

  validates :name, :presence => true, :uniqueness => true

  has_many :experiences
  has_many :projects
  has_many :educations
  has_many :skills

  accepts_nested_attributes_for :projects, :educations, :skills, :experiences,
                                allow_destroy: true, reject_if: :all_blank                              

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
