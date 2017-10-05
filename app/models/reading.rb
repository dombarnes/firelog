class Reading < ActiveRecord::Base
  after_initialize :init

  validates :indoor_temperature, presence: true
  validates :outdoor_temperature, presence: true
  validates :date, presence: true

  default_scope { order(date: :asc) }
  scope :yesterday, -> { where date: 1.day.ago..DateTime.now }
  scope :last_week, -> { where date: 1.week.ago..DateTime.now }
  scope :historical, -> { where("date < ?", 6.months.ago) }

  def init
    self.outdoor_temperature ||= 0
  end
  
  def self.to_farenheit
    @f ||= (@c * (9.0 / 5.0)) + 32
  end

end
