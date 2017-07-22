# frozen_string_literal: true

require 'kaminari/sequel/sequel_dataset_methods'

module Kaminari
  module SequelModelExtension #:nodoc:
    extend ActiveSupport::Concern
    include Kaminari::ConfigurationMethods

    module ClassMethods #:nodoc:
      define_method(Kaminari.config.page_method_name) do |num|
        per_page =
          if max_per_page && (default_per_page > max_per_page)
            max_per_page
          else
            default_per_page
          end

        limit(per_page)
          .offset(per_page * ((num = num.to_i - 1) < 0 ? 0 : num))
          .with_extend(
            Kaminari::SequelDatasetMethods,
            Kaminari::PageScopeMethods
          )
      end
    end
  end
end
