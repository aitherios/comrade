# -*- encoding: utf-8 -*-

require 'date'

class DateTime

  # Returns the unix time, also know as unix
  def unix_time
    strftime('%s').to_i
  end
end

module Comrade
  require 'version'
  require 'rubygems'
  require 'treetop'

  base_path = File.expand_path File.dirname(__FILE__)
  Treetop.load File.join(base_path, 'period_grammar.treetop')

  class Timer

    def initialize time_period_string
      @started_at = DateTime.now
      @stops_at = @started_at + period_in_days(time_period_string)
    end

    def elapsed_ratio
      elapsed_seconds.to_f / total_seconds.to_f
    end

    def elapsed_percentage
      elapsed_ratio * 100
    end
    
    def remaining_ratio
      1 - elapsed_ratio
    end

    def remaining_percentage
      remaining_ratio * 100
    end

    def elapsed?
      DateTime.now >= @stops_at
    end

    private
    
    def period_in_days time_period_string
      parsed = PeriodParser.new.parse time_period_string

      raise 'Parsing Error' if parsed.nil?

      if parsed.time_unit.second?
        parsed.number.text_value.to_f / 86400
      elsif parsed.time_unit.minute?
        parsed.number.text_value.to_f / 1440
      elsif parsed.time_unit.hour?
        parsed.number.text_value.to_f / 24
      end
    end

    def total_seconds
      @stops_at.unix_time - @started_at.unix_time
    end

    def elapsed_seconds
      DateTime.now.unix_time - @started_at.unix_time
    end

  end

end
