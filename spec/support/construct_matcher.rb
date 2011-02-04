# -*- encoding: utf-8 -*-

RSpec::Matchers.define :construct do |string, opts|
  match do |object|
    begin
      object.new string
    rescue
      false
    end
  end

  failure_message_for_should do |object|
    "expected that #{object} would #{description}"
  end

  failure_message_for_should_not do |object|
    "expected that #{object} would not #{description}"
  end

  description do
    "be created with with '#{string}'"
  end
end
