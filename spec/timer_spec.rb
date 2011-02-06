# -*- encoding: utf-8 -*-

require 'spec_helper'

describe Comrade::Timer do

  describe 'new' do
    subject { Comrade::Timer }
    it { should_not construct '' }
    it { should construct '60 seconds' }
    it { should construct '24h' }
    it { should construct '13:37' }
    it { should construct '25m loop' }
  end

  context 'beeing initialized with 10 seconds' do
    before { @timer = Comrade::Timer.new '10 seconds' }
    subject { @timer }
  
    context 'when elapsed seconds is 0' do
      before { @timer.should_receive(:elapsed_seconds).any_number_of_times.and_return(0) }
      its(:elapsed_ratio) { should == 0.0 }
      its(:elapsed_percentage) { should == 0 }
      its(:remaining_ratio) { should == 1.0 }
      its(:remaining_percentage) { should == 100 }
      its(:elapsed?) { should be_false }
    end
  
    context 'when elapsed seconds is 5' do
      before { @timer.should_receive(:elapsed_seconds).any_number_of_times.and_return(5) }
      its(:elapsed_ratio) { should == 0.5 }
      its(:elapsed_percentage) { should == 50 }
      its(:remaining_ratio) { should == 0.5 }
      its(:remaining_percentage) { should == 50 }
      its(:elapsed?) { should be_false }
    end
  
    context 'when elapsed seconds is 10' do
      before { @timer.should_receive(:elapsed_seconds).any_number_of_times.and_return(10) }
      its(:elapsed_ratio) { should == 1.0 }
      its(:elapsed_percentage) { should == 100 }
      its(:remaining_ratio) { should == 0.0 }
      its(:remaining_percentage) { should == 0 }
      its(:elapsed?) { should be_true }
    end
  
    context 'when elapsed seconds greater than 10' do
      before { @timer.should_receive(:elapsed_seconds).any_number_of_times.and_return(12) }
      its(:elapsed_ratio) { should == 1.0 }
      its(:elapsed_percentage) { should == 100 }
      its(:remaining_ratio) { should == 0.0 }
      its(:remaining_percentage) { should == 0 }
      its(:elapsed?) { should be_true }
    end
  end

  context 'when concerning the loop option' do
    context 'present' do
      before { @timer = Comrade::Timer.new '10 seconds loop' }
      subject { @timer }

      it { should respond_to :loop? }
      its(:loop?) { should be_true }
    end

    context 'missing' do
      before { @timer = Comrade::Timer.new '10 seconds' }
      subject { @timer }

      it { should respond_to :loop? }
      its(:loop?) { should be_false }
    end
  end

end
