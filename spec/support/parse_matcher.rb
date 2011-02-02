# -*- encoding: utf-8 -*-

RSpec::Matchers.define :parse do |string, opts|
  match do |parser|
    parser.parse(string) != nil
  end

  failure_message_for_should do |parser|
    "expected that #{parser} would #{description}"
  end

  failure_message_for_should_not do |parser|
    "expected that #{parser} would not #{description}"
  end

  description do
    "parse the string '#{string}'"
  end
end
