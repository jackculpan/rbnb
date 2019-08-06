class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pool
  validates :user, :pool, presense: true
  validates :total_amount, numericality: { only_integer: true }, presence: true
  validates :start_date, :end_date, presence: true
end
