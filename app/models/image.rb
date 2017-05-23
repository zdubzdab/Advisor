class Image < ApplicationRecord
  belongs_to :hotel, inverse_of: :images

  mount_uploaders :photos, ImgUploader

  validates_presence_of :photos
end
