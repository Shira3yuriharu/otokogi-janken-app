class Travel < ApplicationRecord
  belongs_to :group
  has_many :travel_selects

  validates :name, presence: true
  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :group_id, presence: true
end
