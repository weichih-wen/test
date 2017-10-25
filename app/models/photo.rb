class Photo < ApplicationRecord
  mount_uploader :file_location, PhotoImageUploader
  validates_presence_of :photo_name, :description, :file_location, :tag, :date
end
