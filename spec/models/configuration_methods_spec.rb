# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'configuration methods' do
  let(:model) { User }

  describe '#default_per_page' do
    subject { model.page(1) }

    context 'by default' do
      specify 'limit_value' do
        expect(subject.limit_value).to eq 25
      end
    end

    context 'when configuring both on global and model-level' do
      before do
        Kaminari.configure { |c| c.default_per_page = 50 }
        model.paginates_per 100
      end

      specify 'limit_value' do
        expect(subject.limit_value).to eq 100
      end
    end

    context 'when configuring multiple times' do
      before do
        Kaminari.configure { |c| c.default_per_page = 10 }
        Kaminari.configure { |c| c.default_per_page = 20 }
      end

      specify 'limit_value' do
        expect(subject.limit_value).to eq 20
      end
    end

    after do
      Kaminari.configure { |c| c.default_per_page = 25 }
      model.paginates_per nil
    end
  end

  describe '#max_per_page' do
    subject { model.page(1).per(1000) }

    context 'by default' do
      specify 'limit_value' do
        expect(subject.limit_value).to eq 1000
      end
    end

    context 'when configuring both on global and model-level' do
      before do
        Kaminari.configure { |c| c.max_per_page = 50 }
        model.max_paginates_per 100
      end

      specify 'limit_value' do
        expect(subject.limit_value).to eq 100
      end
    end

    context 'when configuring multiple times' do
      before do
        Kaminari.configure { |c| c.max_per_page = 10 }
        Kaminari.configure { |c| c.max_per_page = 20 }
      end

      specify 'limit_value' do
        expect(subject.limit_value).to eq 20
      end
    end

    after do
      Kaminari.configure { |c| c.max_per_page = nil }
      model.max_paginates_per nil
    end
  end

  describe '#max_pages' do
    before do
      100.times do |count|
        model.create(name: "User#{count}")
      end
    end

    subject { model.page(1).per(5) }

    context 'by default' do
      specify 'total_pages' do
        expect(subject.total_pages).to eq 20
      end
    end

    context 'when configuring both on global and model-level' do
      before do
        Kaminari.configure { |c| c.max_pages = 10 }
        model.max_pages 15
      end

      specify 'total_pages' do
        expect(subject.total_pages).to eq 15
      end
    end

    context 'when configuring multiple times' do
      before do
        Kaminari.configure { |c| c.max_pages = 10 }
        Kaminari.configure { |c| c.max_pages = 15 }
      end

      specify 'total_pages' do
        expect(subject.total_pages).to eq 15
      end
    end

    after do
      Kaminari.configure { |c| c.max_pages = nil }
      model.max_pages nil
    end
  end
end
