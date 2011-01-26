require 'date'

class DateTime
  def unix_epoch
    strftime('%s').to_f
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
      currently_at = DateTime.now
      (currently_at.unix_epoch - @started_at.unix_epoch) / (@stops_at.unix_epoch - @started_at.unix_epoch)
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

    protected
    
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

  end

end
