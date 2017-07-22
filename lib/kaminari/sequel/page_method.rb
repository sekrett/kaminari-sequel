# frozen_string_literal: true

module Kaminari
  module Sequel
    module PageMethod
      def page_method(num)
        per_page =
          if max_per_page && (default_per_page > max_per_page)
            max_per_page
          else
            default_per_page
          end

        limit(per_page)
          .offset(per_page * ((num = num.to_i - 1) < 0 ? 0 : num))
          .with_extend(
            Kaminari::Sequel::DatasetMethods,
            Kaminari::PageScopeMethods
          )
      end
    end
  end
end
