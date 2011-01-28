# -*- encoding: utf-8 -*-

require 'date'
class DateTime
  # Returns the Unix time, also know as POSIX time or Unix epoch.
  # The number of seconds elapsed since midnight of January 1, 1970 UTC
  # [return] Fixnum
  def unix_time
    strftime('%s').to_i
  end
end

module Comrade
  require 'version'
  require 'rubygems'
  require 'treetop'

  base_path = File.expand_path File.dirname(__FILE__)
  # Treetop grammar used to parse time period inputs
  Treetop.load File.join(base_path, 'period_grammar.treetop')

  class Timer

    # Initializes the variables started_at and stops_at
    # [param] time_period_string string to be parsed by treetop
    def initialize time_period_string
      @started_at = DateTime.now
      @stops_at = @started_at + period_in_days(time_period_string)
    end

    # Elapsed time ratio
    # Starts at 1.0 and goes down to 0.0
    # [return] Float
    def elapsed_ratio; elapsed_seconds.to_f / total_seconds.to_f end

    # Elapsed time percentage
    # Starts at 100 and goes down to 0
    # [return] Float
    def elapsed_percentage; elapsed_ratio * 100 end
    
    # Remaining time ratio
    # Starts at 0.0 and goes to 1.0
    # [return] Float
    def remaining_ratio; 1 - elapsed_ratio end

    # Remaining time percentage
    # Starts at 0 and goes down to 100
    # [return] Float
    def remaining_percentage; remaining_ratio * 100 end

    # Return if the time has elapsed
    def elapsed?
      DateTime.now >= @stops_at
    end
    alias :finished? :elapsed?

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

    # Seconds between timer start and expected end
    # [return] Fixnum
    def total_seconds
      @stops_at.unix_time - @started_at.unix_time
    end

    # Elapsed seconds since timer started
    # [return] Fixnum
    def elapsed_seconds
      DateTime.now.unix_time - @started_at.unix_time
    end

  end

end
