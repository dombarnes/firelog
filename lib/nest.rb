require 'rubygems'
require 'bundler'

Bundler.require

require './app'

Bundler.require
class NestData
  attr_accessor :date, :indoor_temperature, :outdoor_temperature, :status
  @@log = Logger.new(STDOUT)

  def initialize(params = {})
    self.date = params.fetch(:date, DateTime.now)
    self.indoor_temperature = params.fetch(:indoor, '')
    self.outdoor_temperature = params.fetch(:outdoor, '')
    self.status = params.fetch(:status, nil)
  end

  def fetch_data
    email = ENV['NEST_EMAIL']
    pass = ENV['NEST_PASS']
    post_code = ENV['POSTCODE']
    nest = NestThermostat::Nest.new(
      email: email,
      password: pass,
      temperature_scale: 'c'
    )
    if nest.present?
      self.indoor_temperature = nest.current_temp
      self.status = nest.status['shared'][nest.device_id]['hvac_heater_state']
    end
    weather = HTTParty.get("https://apps-weather.nest.com/weather/v1?query=#{post_code}")
    case weather.code
    when 400...600
      @@log.warn "Stats #{weather.code} ERROR: #{weather.message} #{weather.headers.inspect}"
      @@log.warn "URL: #{weather.request.path.to_s}"
    when 200
      @@log.info 'Status 200 OK: API responding'
      outdoor_temp = weather.parsed_response[ENV['POSTCODE']]['current']['temp_c']
      self.outdoor_temperature = outdoor_temp
    end
  end

  def to_hash
    instance_variables.each_with_object({}) { |var, hash| hash[var.to_s.delete('@')] = instance_variable_get(var) }
  end
end
