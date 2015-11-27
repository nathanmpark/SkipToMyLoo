class Toilet < ActiveRecord::Base

  has_many :ratings

  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :toilet_paper, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
  validates :door_gap, numericality: {greater_than_or_equal_to: 1, less_than_or_equal_to: 5}
end
