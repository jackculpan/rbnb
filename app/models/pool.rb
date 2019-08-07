class Pool < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :users, through: :bookings
  validates :location, :price, :number_of_people, :description, presence: true
end
