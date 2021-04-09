class Result < ApplicationRecord
  belongs_to :travel_select
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
end
