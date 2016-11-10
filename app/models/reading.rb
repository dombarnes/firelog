class Reading < ActiveRecord::Base
  validates :indoor_temperature, presence: true
  validates :outdoor_temperature, presence: true
  validates :date, presence: true
end
