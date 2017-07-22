# frozen_string_literal: true

require 'kaminari/sequel/sequel_model_extension'

module Kaminari
  module SequelExtension #:nodoc:
    extend ActiveSupport::Concern

    module ClassMethods #:nodoc:
      # Future subclasses will pick up the model extension
      def inherited(klass) #:nodoc:
        super
        klass.send(:include, Kaminari::SequelModelExtension)
      end
    end

    included do
      # Existing subclasses pick up the model extension as well
      descendants.each do |klass|
        klass.send(:include, Kaminari::SequelModelExtension)
      end
    end
  end
end
