class Result < ApplicationRecord
  belongs_to :travel_select
  has_one_attached :image
end
