class Pool < ApplicationRecord
  belongs_to :user
  has_many :users, through :bookings
  has_many :reviews, through :bookings
  validates :location, :price, :number_of_people, :description, presence: true
end
