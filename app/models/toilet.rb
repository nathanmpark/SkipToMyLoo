class Toilet < ActiveRecord::Base

  has_many :ratings

  validates :latitude, presence: true
  validates :longitude, presence: true

end
