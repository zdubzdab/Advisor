class Address < ApplicationRecord
  belongs_to :hotel, inverse_of: :address

  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :street, presence: true
end
