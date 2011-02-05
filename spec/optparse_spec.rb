# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Comrade::Optparse do
  describe 'parse' do
    it 'should return a hash' do
      Comrade::Optparse.parse('').should be_an_instance_of Hash
      Comrade::Optparse.parse('-h').should be_an_instance_of Hash
    end

    it 'should parse help message' do
      hash = Comrade::Optparse.parse('-h')
      hash[:message].should be_an_instance_of String
      hash[:message].should_not be_empty
      hash[:exit].should be_true

      hash = Comrade::Optparse.parse('--help')
      hash[:message].should be_an_instance_of String
      hash[:message].should_not be_empty
      hash[:exit].should be_true
    end

    it 'should parse version' do
      hash = Comrade::Optparse.parse('--version')
      hash[:message].should be_an_instance_of String
      hash[:message].should_not be_empty
      hash[:exit].should be_true
    end
  end
end
