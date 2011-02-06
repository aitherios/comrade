# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Comrade::Optparse do

  describe 'parse' do

    it { Comrade::Optparse.parse!(['']).should be_an_instance_of Hash }
    it { Comrade::Optparse.parse!(['-h']).should be_an_instance_of Hash }

    context 'when parsing help flag' do
      context 'short style' do
        subject { Comrade::Optparse.parse! ['-h'] }
        its([:message]) { should be_an_instance_of String }
        its([:message]) { should_not be_empty }
        its([:exit]) { should be_true }
      end

      context 'long style' do
        subject { Comrade::Optparse.parse! ['--help'] }
        its([:message]) { should be_an_instance_of String }
        its([:message]) { should_not be_empty }
        its([:exit]) { should be_true }
      end
    end

    context 'when parsing version flag' do
      subject { Comrade::Optparse.parse! ['--version'] }
      its([:message]) { should be_an_instance_of String }
      its([:message]) { should_not be_empty }
      its([:exit]) { should be_true }
    end

    describe '[:color]', 'line color flag' do
      context 'short style' do
        subject { Comrade::Optparse.parse! ['-c', 'blue'] }
        its([:color]) { should be_an_instance_of String }
        its([:color]) { should_not be_empty }
        its([:color]) { should == 'blue' }
      end

      context 'long style' do
        subject { Comrade::Optparse.parse! ['--color', 'blue'] }
        its([:color]) { should be_an_instance_of String }
        its([:color]) { should_not be_empty }
        its([:color]) { should == 'blue' }
      end

      context 'long style, british spelling' do
        subject { Comrade::Optparse.parse! ['--colour', 'blue'] }
        its([:color]) { should be_an_instance_of String }
        its([:color]) { should_not be_empty }
        its([:color]) { should == 'blue' }
      end

      context 'default value' do
        subject { Comrade::Optparse.parse! ['25m'] }
        its([:color]) { should be_an_instance_of String }
        its([:color]) { should_not be_empty }
        its([:color]) { should == 'red' }
      end
    end

    describe '[:size]', 'line size flag' do
      context 'short style' do
        subject { Comrade::Optparse.parse! ['-s', '250'] }
        its([:size]) { should be_an_instance_of Fixnum}
        its([:size]) { should == 250 }
      end

      context 'long style' do
        subject { Comrade::Optparse.parse! ['--size', '250'] }
        its([:size]) { should be_an_instance_of Fixnum}
        its([:size]) { should == 250 }
      end

      context 'default value' do
        subject { Comrade::Optparse.parse! ['25m'] }
        its([:size]) { should be_an_instance_of Fixnum}
        its([:size]) { should == 1280 }
      end
    end

    describe '[:thickness]', 'line thickness flag' do
      context 'short style' do
        subject { Comrade::Optparse.parse! ['-t', '250'] }
        its([:thickness]) { should be_an_instance_of Fixnum }
        its([:thickness]) { should == 250 }
      end

      context 'long style' do
        subject { Comrade::Optparse.parse! ['--thickness', '250'] }
        its([:thickness]) { should be_an_instance_of Fixnum }
        its([:thickness]) { should == 250 }
      end
      
      context 'default value' do
        subject { Comrade::Optparse.parse! ['25m'] }
        its([:thickness]) { should be_an_instance_of Fixnum }
        its([:thickness]) { should == 1 }
      end
    end

    describe '[:timer]', 'timer arguments' do
      context 'without a loop' do
        subject { Comrade::Optparse.parse! ['-t', '250', '25m'] }
        its([:timer]) { should == '25m' }
      end

      context 'with a loop' do
        subject { Comrade::Optparse.parse! ['-t', '250', '25m', 'loop'] }
        its([:timer]) { should == '25m loop' }
      end
    end

  end

end
