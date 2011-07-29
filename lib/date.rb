# -*- encoding: utf-8 -*-

require 'date'

class DateTime
  # Returns the Unix time, also know as POSIX time or Unix epoch.
  # The number of seconds elapsed since midnight of January 1, 1970 UTC
  # [return] Fixnum
  def unix_time
    strftime('%s').to_f
  end
end

class Time
  # Returns the Unix time, also know as POSIX time or Unix epoch.
  # The number of seconds elapsed since midnight of January 1, 1970 UTC
  # [return] Fixnum
  def unix_time
    strftime('%s').to_f
  end
end
