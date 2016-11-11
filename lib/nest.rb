require './app'
require 'nest_thermostat'
require 'httparty'

class NestData
  attr_accessor :date, :indoor_temperature, :outdoor_temperature, :status

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
    if weather.code == 200
      outdoor_temp = weather.parsed_response[ENV['POSTCODE']]['current']['temp_c']
      self.outdoor_temperature = outdoor_temp
    else
      $log.debug "Unable to retrieve weather data: #{weather.parsed_response}"
      $log.debug 'URL: '
      raise Exception, "Bad response [#{weather.code}] - #{weather.message}"
    end
  end

  def to_hash
    instance_variables.each_with_object({}) { |var, hash| hash[var.to_s.delete('@')] = instance_variable_get(var) }
  end
end
