# frozen_string_literal: true

require 'kaminari/sequel/dataset_methods'
require 'kaminari/sequel/page_method'

module Kaminari
  module Sequel
    module ModelExtensionMethods #:nodoc:
      extend ActiveSupport::Concern

      module ClassMethods #:nodoc:
        include Kaminari::ConfigurationMethods::ClassMethods
        include Kaminari::Sequel::PageMethod

        define_method(Kaminari.config.page_method_name) do |num|
          page_method(num)
        end
      end
    end
  end
end
