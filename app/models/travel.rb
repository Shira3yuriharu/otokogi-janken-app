class Travel < ApplicationRecord
  belongs_to :group
  has_many :travel_selects
  has_many :comments

  validates :name, presence: true,  length: { maximum: 15 }
  validates :start_day, presence: true
  validates :end_day, presence: true
  validates :group_id, presence: true

  validate :end_day_check

  def end_day_check
    errors.add(:end_day, "は開始時刻より遅い時間を選択してください") if self.start_day > self.end_day
  end

end
