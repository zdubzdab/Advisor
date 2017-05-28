class Rating < ApplicationRecord
  belongs_to :hotel, inverse_of: :ratings
  belongs_to :user

  validates :score, presence: true,
    numericality: { greater_than: 0,
      less_than_or_equal_to: 5,  only_integer: true }
end
