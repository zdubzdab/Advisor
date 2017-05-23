class Hotel < ApplicationRecord
  has_one :address, inverse_of: :hotel
  has_many :images, inverse_of: :hotel
  belongs_to :user

  validates :title, presence: true,
                    uniqueness: true
  validates :description, presence: true
  validates :price, presence: true,
                    numericality: true

  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :images, allow_destroy: true
end
