class Reading < ActiveRecord::Base
  validates :indoor_temperature, presence: false
  validates :outdoor_temperature, presence: false
  validates :date, presence: true

  default_scope { order(date: :asc) }
  scope :yesterday, -> { where date: 1.day.ago..DateTime.now }
  scope :last_week, -> { where date: 1.week.ago..DateTime.now }
end
