class TravelSelect < ApplicationRecord
  belongs_to :travel
  belongs_to :user

  validates :travel_id, presence: true
end
