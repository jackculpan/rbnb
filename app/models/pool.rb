class Pool < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  has_many :users, through: :bookings
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :location, :price, :number_of_people, :description, presence: true
  mount_uploader :photo, PhotoUploader
end
