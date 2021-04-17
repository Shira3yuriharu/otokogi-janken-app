class TravelSelect < ApplicationRecord
  belongs_to :travel
  belongs_to :user
  has_many :results

  validates :travel_id, presence: true
end
