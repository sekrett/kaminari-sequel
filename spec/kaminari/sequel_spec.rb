# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Kaminari::Sequel do
  it 'has a version number' do
    expect(Kaminari::Sequel::VERSION).not_to be nil
  end

  describe 'Model' do
    subject { User }
    it { expect(subject).to respond_to(:page) }
    it { expect(subject).to respond_to(:default_per_page) }
    it { expect(subject).to respond_to(:max_per_page) }
    it { expect(subject).not_to respond_to(:per) }
  end

  describe 'Dataset' do
    subject { User.dataset }
    it { expect(subject).to respond_to(:page) }
    it { expect(subject).to respond_to(:default_per_page) }
    it { expect(subject).to respond_to(:max_per_page) }
    it { expect(subject).not_to respond_to(:per) }
  end

  describe 'Page' do
    subject { User.page(1) }
    it { expect(subject).to respond_to(:page) }
    it { expect(subject).to respond_to(:default_per_page) }
    it { expect(subject).to respond_to(:max_per_page) }
    it { expect(subject).to respond_to(:per) }
  end
end
