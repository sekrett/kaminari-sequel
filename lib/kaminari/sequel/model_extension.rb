# frozen_string_literal: true

require 'kaminari/sequel/model_extension_methods'

module Kaminari
  module Sequel
    module ModelExtension #:nodoc:
      extend ActiveSupport::Concern

      module ClassMethods #:nodoc:
        # Future subclasses will pick up the model extension
        def inherited(klass) #:nodoc:
          super
          klass.send(:include, Kaminari::Sequel::ModelExtensionMethods)
        end
      end

      included do
        # Existing subclasses pick up the model extension as well
        descendants.each do |klass|
          klass.send(:include, Kaminari::Sequel::ModelExtensionMethods)
        end
      end
    end
  end
end
