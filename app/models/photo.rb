class Photo < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
