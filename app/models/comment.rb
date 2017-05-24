class Comment < ApplicationRecord
  belongs_to :hotel
  belongs_to :user

  validates :text, presence: true

  delegate :email, to: :user
end
