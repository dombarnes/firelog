class Reading < ActiveRecord::Base
  validates :indoor_temperature, presence: false
  validates :outdoor_temperature, presence: false
  validates :date, presence: true
end
