class Hotel < ApplicationRecord
  has_one :address, inverse_of: :hotel, dependent: :destroy
  has_many :images, inverse_of: :hotel, dependent: :destroy
  has_many :comments, inverse_of: :hotel, dependent: :destroy
  has_many :ratings, dependent: :destroy

  belongs_to :user

  validates :title, presence: true,
                    uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: true

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true

  HOTEL_INDEX_PAGE = 10
  HOTEL_COMMENT_SHOW_PAGE = 3
end
