# -*- encoding: utf-8 -*-

require 'spec_helper'

describe PeriodParser do
  describe '#parse' do
    before { @parser = PeriodParser.new }
    subject { @parser }

    it { should_not be_nil }
    it { should_not parse '' }

    context 'when parsing seconds in english' do
      it { should parse '1 second' }
      it { should parse '300 seconds' }
      it { should parse '1 sec' }
      it { should parse '20 secs' }
      it { should parse '1s' }
    end

    context 'when parsing seconds in portuguese' do
      it { should parse '1 segundo' }
      it { should parse '300 segundos' }
      it { should parse '1 seg' }
      it { should parse '20 segs' }
    end
    
    context 'when parsing minutes in english' do
      it { should parse '1 minute' }
      it { should parse '25 minutes' }
      it { should parse '1 min' }
      it { should parse '5 mins' }
      it { should parse '5m' }
    end
    
    context 'when parsing minutes in portuguese' do
      it { should parse '1 minuto' }
      it { should parse '25 minutos' }
    end

    context 'when parsing hours in english' do
      it { should parse '1 hour' }
      it { should parse '24 hours' }
      it { should parse '1h' }
    end

    context 'when parsing hours in portuguese' do
      it { should parse '1 hora' }
      it { should parse '2 horas' }
    end

    context 'when parsing a timestamp' do
      it { should parse '1:30' }
      it { should parse '23:30' }
      it { should parse '23:30:21' }
      it { should parse '11:30 am' }
      it { should parse '11:30pm' }
    end

  end
end
