# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Comrade::Optparse do

  describe 'parse' do

    it 'should return a hash' do
      Comrade::Optparse.parse!(['']).should be_an_instance_of Hash
      Comrade::Optparse.parse!(['-h']).should be_an_instance_of Hash
    end

    it 'should parse help message flag' do
      hash = Comrade::Optparse.parse! ['-h']
      hash[:message].should be_an_instance_of String
      hash[:message].should_not be_empty
      hash[:exit].should be_true

      hash = Comrade::Optparse.parse! ['--help']
      hash[:message].should be_an_instance_of String
      hash[:message].should_not be_empty
      hash[:exit].should be_true
    end

    it 'should parse version flag' do
      hash = Comrade::Optparse.parse! ['--version']
      hash[:message].should be_an_instance_of String
      hash[:message].should_not be_empty
      hash[:exit].should be_true
    end

    it 'should parse color flag' do
      hash = Comrade::Optparse.parse! ['-c', 'blue']
      hash[:color].should be_an_instance_of String
      hash[:color].should_not be_empty
      hash[:color].should == 'blue'

      hash = Comrade::Optparse.parse! ['--color', 'blue']
      hash[:color].should be_an_instance_of String
      hash[:color].should_not be_empty
      hash[:color].should == 'blue'

      hash = Comrade::Optparse.parse! ['--color=blue']
      hash[:color].should be_an_instance_of String
      hash[:color].should_not be_empty
      hash[:color].should == 'blue'

      hash = Comrade::Optparse.parse! ['--color', '#ffffff']
      hash[:color].should be_an_instance_of String
      hash[:color].should_not be_empty
      hash[:color].should == '#ffffff'

      hash = Comrade::Optparse.parse! ['--colour', '#ffffff']
      hash[:color].should be_an_instance_of String
      hash[:color].should_not be_empty
      hash[:color].should == '#ffffff'
    end

    it 'should parse line size' do
      hash = Comrade::Optparse.parse! ['-s', '250']
      hash[:size].should be_an_instance_of Fixnum
      hash[:size].should == 250

      hash = Comrade::Optparse.parse! ['--size', '250']
      hash[:size].should be_an_instance_of Fixnum
      hash[:size].should == 250
    end

    it 'should parse line thickness' do
      hash = Comrade::Optparse.parse! ['-t', '250']
      hash[:thickness].should be_an_instance_of Fixnum
      hash[:thickness].should == 250

      hash = Comrade::Optparse.parse! ['--thickness', '250']
      hash[:thickness].should be_an_instance_of Fixnum
      hash[:thickness].should == 250
    end

    it 'should return timer arguments' do
      hash = Comrade::Optparse.parse! ['-t', '250', '25m']
      hash[:timer].should == '25m'

      hash = Comrade::Optparse.parse! ['-t', '250', '25m', 'loop']
      hash[:timer].should == '25m loop'
    end

  end

end
