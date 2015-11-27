class Rating < ActiveRecord::Base

  belongs_to :toilet
  belongs_to :user

  validates :stars, presence: true

end
