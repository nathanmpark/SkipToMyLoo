class Toilet < ActiveRecord::Base

  has_many :ratings

  validates :lat, presence: true
  validates :long, presence: true
end
