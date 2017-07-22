# frozen_string_literal: true

module Kaminari
  module SequelDatasetMethods #:nodoc:
    delegate :default_per_page, :max_per_page, :max_pages, to: :model

    def entry_name(_options = {}) #:nodoc:
      model.to_s.downcase
    end

    def limit_value #:nodoc:
      opts[:limit]
    end

    def offset_value #:nodoc:
      opts[:offset]
    end

    def total_count(_column_name = :all, _options = nil) #:nodoc:
      @total_count ||= unlimited.unordered.count
    end

    def size #:nodoc:
      model.count
    end
  end
end
