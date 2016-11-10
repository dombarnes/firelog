require 'nest_thermostat'
require 'httparty'
class NestData
  attr_accessor :date, :indoor_temperature, :outdoor_temperature

  def initialize(params = {})
    self.date = params.fetch(:date, Time.now)
    self.indoor_temperature = params.fetch(:indoor, '')
    self.outdoor_temperature = params.fetch(:outdoor, '')
  end

  def fetch_data
    nest = NestThermostat::Nest.new({email: ENV['NEST_EMAIL'], password: ENV['NEST_PASS'], temperature_scale: 'c'})
    if nest.present?
      self.indoor_temperature = nest.current_temp
    end
    post_code = ENV['POSTCODE']
    weather = HTTParty.get("https://apps-weather.nest.com/weather/v1?query=#{post_code}")
    if weather.code == 200
      outdoor_temp = weather.parsed_response[ENV['POSTCODE']]['current']['temp_c']
      self.outdoor_temperature = outdoor_temp
    else
      $log.debug response.parsed_response
      raise Exception.new("Bad response.\n#{response.message}")
    end
  end

  def to_hash
    hash = self.instance_variables.each_with_object({}) { |var, hash| hash[var.to_s.delete("@")] = self.instance_variable_get(var) }
  end

end
