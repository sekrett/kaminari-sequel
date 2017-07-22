# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Kaminari::Sequel do
  it 'has a version number' do
    expect(Kaminari::Sequel::VERSION).not_to be nil
  end

  describe 'Model' do
    subject { User }
    it { should respond_to(:page) }
    it { should respond_to(:default_per_page) }
    it { should_not respond_to(:per) }
  end
end
